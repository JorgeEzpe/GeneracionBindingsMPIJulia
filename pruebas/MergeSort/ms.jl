include("../bindings/macroBindings.jl")
include("../bindings/functionBindings.jl")

using Random,Printf

function merge(i::Int, chunk_i::Int, j::Int, chunk_j::Int, v::Vector{Cdouble}, tmp::Vector{Cdouble})
   
    i0=i
    p=1

    while chunk_i > 0 && chunk_j > 0
        if v[i] < v[j]
            tmp[p] = v[i]
            i += 1
            chunk_i -= 1
        else
            tmp[p] = v[j]
            j += 1
            chunk_j -= 1
        end
        p += 1
    end

    while chunk_i > 0
        tmp[p] = v[i]
        i += 1
        p += 1
        chunk_i -= 1
    end

    while chunk_j > 0
        tmp[p] = v[j]
        j += 1
        p += 1
        chunk_j -= 1
    end

    for c in 1:(p - 1)
        v[i0 + c - 1] = tmp[c]
    end

end

function load_vector!(v::Vector{Float64})
    open("random_vector.bin", "r") do io
        read!(io, v)
    end
    return v
end

function msort(n::Int, r::Int)::Tuple{Float64, Int}

    comm_time_sum = Ref{Cdouble}(0.0)

    MPI_Init()
    rank=Ref{Cint}()
    size=Ref{Cint}()
    comm=MPI_COMM_WORLD
    double=MPI_DOUBLE
    MPI_Comm_rank(MPI_COMM_WORLD, rank)
    MPI_Comm_size(MPI_COMM_WORLD, size)
    p=-1
    t=0.0

    if n % size[] != 0
        n = ceil(Int, n / size[]) * size[]
    end 

    v = Vector{Cdouble}(undef, n)
    chunk = div(n, size[])
    local_v = Vector{Cdouble}(undef, chunk)
    result = Vector{Cdouble}(undef, n)

    tmp = Vector{Cdouble}(undef, n)

    if rank[] == 0
        load_vector!(v)
    end

    sort_time = 0.0
    merge_time=0.0

    MPI_Barrier(MPI_COMM_WORLD)
    t_start = time_ns()

    for j in 1:r
        
        MPI_Scatter(v, Cint(chunk), double, local_v, Cint(chunk),double,Cint(0), comm)
    
        t1 = time_ns()
        sort!(local_v)
        t2 = time_ns()

        sort_time += (t2 - t1) / 1e9
    
        MPI_Gather(local_v, Cint(chunk), double,result, Cint(chunk), double,Cint(0), comm)

        t3 = time_ns()
        if rank[] == 0
            for i in 1:(size[] - 1)
                merge(1, chunk * i, chunk * i + 1, chunk, result, tmp)
            end
        end
        MPI_Barrier(MPI_COMM_WORLD)
        t4 = time_ns()
        merge_time += (t4 - t3) / 1e9
    end
    
    t_end = time_ns()
    total_time = (t_end - t_start) / 1e9
    comm_time = total_time - sort_time - merge_time

    MPI_Reduce(Ref(comm_time), comm_time_sum, Cint(1), double, MPI_SUM, Cint(0), comm)

    if rank[] == 0
        p=size[]
        t = comm_time_sum[] / size[]
    end

    MPI_Finalize()

    return (t,p)

end

n = parse(Int, ARGS[1])
r = parse(Int, ARGS[2])

t,p=msort(n, r)

if p!=-1
    open("../Resultados/MS/MSMPI4ALL.txt", "a") do file
        write(file,string(p, ",", n, ",", t, "\n"))
    end
end