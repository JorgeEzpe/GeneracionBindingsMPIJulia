import os
import logging
import io
import re
from typing import Dict, Any

from mpi4all.generator.base import BaseGenerator

KEYWORDS = {
    'baremodule', 'begin', 'break', 'catch', 'const', 'continue', 'do', 'else',
    'elseif', 'end', 'export', 'false', 'finally', 'for', 'function', 'global',
    'if', 'import', 'let', 'local', 'macro', 'module', 'quote', 'return', 'struct',
    'true', 'try', 'using', 'while', 'where'
}

HELPER_FUNCTIONS = '''
function check(code::Cint)
    if code != 0
        error("MPI error: return code = $code")
    end
end

MPI_Init()=MPI_Init(Ref{Cint}(0), Ptr{Ptr{Ptr{Cchar}}}(0))

Base.cconvert(::Type{MPIPtr}, x::Ref) = x
Base.unsafe_convert(::Type{MPIPtr}, x::Ref) = reinterpret(MPIPtr, Base.unsafe_convert(Ptr{Cvoid}, x))
Base.cconvert(::Type{MPIPtr}, x::Ptr) = x
Base.unsafe_convert(::Type{MPIPtr}, x::Ptr) = reinterpret(MPIPtr, x)
Base.cconvert(::Type{MPIPtr}, x::Vector) = x
Base.unsafe_convert(::Type{MPIPtr}, x::Vector) = reinterpret(MPIPtr, pointer(x))
Base.cconvert(::Type{MPIPtr}, x::Matrix) = x
Base.unsafe_convert(::Type{MPIPtr}, x::Matrix) = reinterpret(MPIPtr, pointer(x))

'''

MPISTATUS='''struct C_MPI_Status
    MPI_SOURCE::Cint
    MPI_TAG::Cint
    MPI_ERROR::Cint
    _private0::Cint
    _private1::Csize_t
end
'''

AUX_DATATYPES='''primitive type MPIPtr Sys.WORD_SIZE end
const ArgPtr{T}= Union{Ref{T},Ptr{T}}
'''

class JuliaGenerator(BaseGenerator):

    def __init__(self,out: str):
        super().__init__('JL')
        self._out = out
        self._julia_types_dec = set()
        self._julia_types = io.StringIO()
        self._julia_macros = io.StringIO()
        self._deferred_macros = []
        self._julia_functions = io.StringIO()
        
        self._c_to_julia = {
            "C_int": "Cint",
            "C_unsigned int": "Cuint",
            "C_short": "Cshort",
            "C_unsigned short": "Cushort",
            "C_long": "Clong",
            "C_unsigned long": "Culong",
            "C_long long": "Clonglong",
            "C_unsigned long long": "Culonglong",
            "C_float": "Cfloat",
            "C_double": "Cdouble",
            "C_char": "Cchar",
            "C_unsigned char": "Cuchar",
            "C_size_t": "Csize_t",
            "C_void": "Cvoid"
        }

        self._opal_constants={
            "OPAL_MAX_DATAREP_STRING": "128",
            "OPAL_MAX_ERROR_STRING": "512",
            "OPAL_MAX_OBJECT_NAME": "128",
            "OPAL_MAX_INFO_KEY": "255",
            "OPAL_MAX_INFO_VAL": "1024",
            "OPAL_MAX_LIBRARY_VERSION_STRING": "8192",
            "OPAL_MAX_OBJECT_NAME": "128",
            "OPAL_MAX_PORT_NAME": "256",
            "OPAL_MAX_PROCESSOR_NAME": "128"
        }

    def _typeAsJulia(self, c_type:str, size:str):

        julia_type ='C_' + c_type.replace('const', '').replace(' ', '')
        prefix=''

        dec_type=julia_type

        if '(*' in julia_type and '*)' in julia_type:
            dec_type=julia_type.split('(', 1)[0].replace(" ","")
            julia_type = 'Ptr{Cvoid}'

        if '*' in julia_type:  
            c = julia_type.count('*')
            dec_type=julia_type.replace('*', '')
            julia_type = 'Ptr{' * c + dec_type + '}'*c

        if '[' in julia_type and ']' in julia_type:
            s = julia_type.index('[')
            e = julia_type.index(']')
            array_size = julia_type[s+1:e].strip()  
            base_type = julia_type[:s].strip()
            
            base_type = self._c_to_julia.get(base_type, base_type)

            if base_type == "Cchar":
                return "String", None
            else:
                julia_type = f"Ptr{{{base_type}}}"
                return julia_type, None
            
        if ',' in julia_type or '()' in julia_type:  
            return 'Ptr{Cvoid}', None

        if dec_type == "C_MPI_Status":
            return julia_type, None
       
        if dec_type in self._c_to_julia:
            dec = 'const ' + dec_type + ' = ' + self._c_to_julia[dec_type] + '\n'
        else:
            s= self._types[dec_type.replace("C_","")] if dec_type.replace("C_", "") in self._types else size
            dec = 'const ' + dec_type + ' = ' + self._to_julia_type(s) + '\n'
        
        return prefix + julia_type, dec


    def _safe_key(self, name: str) -> str:
        if name in KEYWORDS:
            return '_' + name
        return name


    def _to_julia_type(self,size:str):

        if 'C_'+size in self._c_to_julia:
            return self._c_to_julia['C_'+size]

        if size == "4":
            return "Cint"

        return "Ptr{Cvoid}"


    def _declare(self, dec: str):
        if dec not in self._julia_types_dec:
            self._julia_types_dec.add(dec)
            self._julia_types.write(dec)


    def _write_macro(self, macro: Dict[str, str]):

        if 'FORTRAN' in macro['name'] or 'FORTRAN' in macro['value'] or macro['name'].startswith('MPI_F_'):
            return
            
        if not macro['var']:
            julia_type, dec = self._typeAsJulia(macro['name'],self._types[macro['type']])
            if dec is not None:
                self._declare(dec.replace(self._prefix, '', 1))
        else:
            julia_type, dec = self._typeAsJulia(macro['type'],self._types[macro['type']])
            if dec is not None:
                self._declare(dec)

            value= macro['value']

            if value.startswith("(") and value.endswith(")"):
                value= value.replace("(", "").rsplit(")",-1)[-2].replace(")","").replace(" ","")
                if value=="NULL":
                    value="C_NULL"

            elif value.startswith("("):
                value = value.replace("(", "").split(")", 1)[-1].strip().replace(")", "")

            if 'OMPI_PREDEFINED_GLOBAL' in value:
                global_name = value.split(",", 1)[1].replace(")", "").strip()
                self._julia_macros.write('const ' + macro['name'] +'::' + julia_type + ' = ' + julia_type + '(cglobal((\"' + global_name + '\",\"libmpi\"),' + julia_type + '))\n')
                
            elif 'OMPI_C_MPI_' in value:
                self._julia_macros.write('const ' + macro['name'] +'::' + julia_type + ' = ' + julia_type + '(cglobal((\"' + value + '\",\"libmpi\"),' + julia_type + '))\n')

            elif 'OPAL_MAX' in value:
                self._julia_macros.write(macro['name'] +'::' + julia_type + ' = '+ self._opal_constants[value]+'\n')

            elif value.startswith("MPI"):
                if value in self._macro_names:
                    self._deferred_macros.append((macro['name'], value, julia_type))
                else:
                    self._julia_macros.write('const ' + macro['name'] + '::' + julia_type + ' = ' + julia_type + '(cglobal(("' + value + '", "libmpi"), ' + julia_type + '))\n')

            elif value.startswith("0x") and int(value, 0) > 0x7fffffff:
                self._julia_macros.write('const ' + macro['name'] +':: Cuint'  + ' = ' + value + '\n')

            else:
                self._julia_macros.write('const ' + macro['name'] +'::' + julia_type + ' = ' + value + '\n')


    def _resolve_deferred_macros(self):
        for name, value, julia_type in self._deferred_macros:
            self._julia_macros.write('const ' + name + '::' + julia_type + ' = ' + value + '\n')

    def _build_functions(self, functions: list, types: dict) -> None:
        for fun in sorted(functions, key=lambda f: f['name']):
            if 'vargs' in fun:
                fun = self._vfun(fun)
            self._write_function(fun, types)
        
    def _write_function(self, fun: Dict[str, Any], types: Dict[str, str]):
        r_type, dec = self._typeAsJulia(fun['rtype'], types[fun['rtype']])  
        if dec:
            self._declare(dec)

        arg_types = []
        arg_names = []
        for i, arg in enumerate (fun['args']):
            julia_type, dec = self._typeAsJulia(arg['type'], types[arg['type']])
            if dec:
                self._declare(dec)
            arg_types.append(julia_type)
            safe_name=self._safe_key(arg['name'])
            arg_names.append(safe_name)

        args_signature = []
        for name, typ in zip(arg_names, arg_types):
            if typ == 'Ptr{C_void}':
                args_signature.append(name)
            elif typ.startswith('Ptr{C_'):
                argtype = re.sub(r"^Ptr\{(.+)\}$", r"ArgPtr{\1}", typ)
                args_signature.append(f"{name}::{argtype}")
            else:
                args_signature.append(f"{name}::{typ}")
        self._julia_functions.write(f"function {fun['name']}({', '.join(args_signature)})::{r_type}\n")

        arg_types_list = ['MPIPtr' if t.startswith('Ptr{') else t for t in arg_types]
        arg_types_str = ', '.join(arg_types_list)
        if len(arg_types_list) == 1:
            arg_types_str += ',' 
        arg_names_str = ', '.join(arg_names)
        self._julia_functions.write(f'    return ccall((:{fun["name"]}, "libmpi"), {r_type}, ({arg_types_str}), {arg_names_str})\n')
        self._julia_functions.write("end\n\n")

    def build(self, info):

        self._types = info['types']

        self._macro_names = {macro['name'] for macro in info['macros']}

        self._build_macros(info)
        self._resolve_deferred_macros()

        self._julia_functions.write(HELPER_FUNCTIONS)

        self._build_functions(info['functions'], info['types'])

        folder = os.path.abspath(self._out)  
        os.makedirs(folder, exist_ok=True) 

        with open(os.path.join(folder, 'macroBindings.jl'), 'w') as macro_file:
            macro_file.write('# Auto-generated file\n')
            macro_file.write(MPISTATUS)
            macro_file.write(AUX_DATATYPES)
            macro_file.write(self._julia_types.getvalue()) 
            macro_file.write('\n\n')
            macro_file.write(self._julia_macros.getvalue()) 

        with open(os.path.join(folder, 'functionBindings.jl'), 'w') as function_file:
            function_file.write('# Auto-generated file\n')
            function_file.write(self._julia_functions.getvalue())  
