using MPI
using LinearAlgebra, Random, Printf

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

    MPI.Init()
    comm = MPI.COMM_WORLD
    rank = MPI.Comm_rank(comm)
    size = MPI.Comm_size(comm)
    procs=size[]

    if n % size != 0
        n = ceil(Int, n / size) * size
    end

    a = Matrix{Float64}(undef, n, n)
    x = zeros(Float64, n)
    b = Vector{Float64}(undef, n)

    if rank[]==0
        a,b=load_data!(a,b)
    end

    x_new = similar(x)
    nor = Ref(0.0)
    iter = 0

    MPI.Barrier(comm)
    t_start = time_ns()

    MPI.Bcast!(a, 0, comm)
    MPI.Bcast!(b, 0, comm)

    chunk_size = ceil(Int, n / size)
    start = rank * chunk_size + 1
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
            x_new[i] = (b[i] - sigma) / a[i, i]
            nor[] += (x_new[i] - x[i])^2
        end

        MPI.Allreduce!(MPI.IN_PLACE, nor, MPI.SUM, comm)

        if sqrt(nor[]) < tol
            break
        end

        local_chunk = view(x_new, start:end_idx)
        MPI.Allgather!(local_chunk, x, comm)

        iter += 1
    end

    t_end = time_ns()
    total_time=(t_end - t_start)/1e9
    total_time_sum= MPI.Reduce(total_time, MPI.SUM, 0, comm)

    if rank[] == 0
        p=size[]
        t=total_time_sum[] / size[] 
    end

    MPI.Finalize()

    return (t,p)

end

n = parse(Int, ARGS[1])
r = parse(Int, ARGS[2])
tol = parse(Float64, ARGS[3])

t,p=jacobi(n, r, tol)

if p!=-1
    open("../Resultados/JM/JMMPIJL.txt", "a") do file
        write(file,string(p, ",", n, ",", t, "\n"))
    end
end

