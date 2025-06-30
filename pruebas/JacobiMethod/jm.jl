include("../bindings/macroBindings.jl")
include("../bindings/functionBindings.jl")

using LinearAlgebra, Random, Libdl, Printf

function load_data!(a::Matrix{Float64}, b::Vector{Float64})
    open("a_matrix.bin", "r") do io
        read!(io, a) 
    end
    open("b_vector.bin", "r") do io
        read!(io, b)
    end
    return a, b
end

function jacobi(n::Int, max_iter::Int, tol::Float64)::Tuple{Float64, Int}

    total_time_sum = Ref{Cdouble}(0.0)
    p=-1
    t=0.0

    MPI_Init()
    rank = Ref{Cint}()
    size = Ref{Cint}()
    comm = MPI_COMM_WORLD
    double = MPI_DOUBLE
    MPI_Comm_rank(comm, rank)
    MPI_Comm_size(comm, size)

    if n % size[] != 0
        n = ceil(Int, n / size[]) * size[]
    end
    
    a = Matrix{Float64}(undef, n, n)
    x = zeros(Float64, n)
    b = Vector{Float64}(undef, n)

    if rank[]==0
        a,b=load_data!(a,b)
    end
    
    x_new = similar(x)         
    nor = Ref{Float64}(0.0)   
    iter = 0  

    MPI_Barrier(MPI_COMM_WORLD)
    t_start = time_ns()

    MPI_Bcast(a, Cint(n*n), double, Cint(0), comm)
    MPI_Bcast(b, Cint(n), double, Cint(0), comm)

    chunk_size = ceil(Int, n / size[])           
    start = rank[] * chunk_size + 1                
    end_idx = min(start + chunk_size - 1, n)   

    while iter < max_iter
        nor[] = 0.0
        for i in start:end_idx
            sigma = 0.0
            for j in 1:i-1
                sigma += a[j,i] * x[j]
            end
            for j in i+1:n
                sigma += a[j,i] * x[j]
            end
            x_new[i] = (b[i] - sigma) / a[i,i]   
            nor[] += (x_new[i] - x[i])*(x_new[i] - x[i])   
        end

        MPI_Allreduce(MPI_IN_PLACE, nor, Cint(1), double, MPI_SUM, comm)

        if sqrt(nor[]) < tol
            break
        end

        MPI_Allgather(pointer(x_new,start), Cint(end_idx - start + 1), double,x, Cint(end_idx - start + 1), double, comm)
        iter += 1
    end

    t_end = time_ns()
    total_time=(t_end - t_start)/1e9
    MPI_Reduce(Ref(total_time), total_time_sum, Cint(1), MPI_DOUBLE, MPI_SUM, Cint(0), MPI_COMM_WORLD)

    if rank[] == 0
        p=size[]
        t=total_time_sum[] / size[] 
    end
    
    MPI_Finalize()

    return (t,p)

end

n = parse(Int, ARGS[1])
r = parse(Int, ARGS[2])
tol = parse(Float64, ARGS[3])

t,p=jacobi(n, r, tol)

if p!=-1
    open("../Resultados/JM/JMMPI4ALL.txt", "a") do file
        write(file,string(p, ",", n, ",", t, "\n"))
    end
end



