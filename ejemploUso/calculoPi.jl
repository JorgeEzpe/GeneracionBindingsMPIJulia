include("bindings/macroBindings.jl")
include("bindings/functionBindings.jl")

function main()

    MPI_Init()
    rank=Ref{Cint}()
    size=Ref{Cint}()
    MPI_Comm_rank(MPI_COMM_WORLD, rank)
    MPI_Comm_size(MPI_COMM_WORLD, size)

    n=1_000_000
    h=1.0/n

    local_sum=Ref{Cdouble}(0.0)
    total_sum=Ref{Cdouble}()

    for i in (rank[] + 1):size[]:n
        x = (i - 0.5) * h
        local_sum[]+= 4.0 / (1.0 + x^2)
    end

    MPI_Reduce(local_sum,total_sum, Cint(1), MPI_DOUBLE, MPI_SUM,  Cint(0), MPI_COMM_WORLD)

    if rank[] == 0
        println("Estimated value of π: ", total_sum[]*h)
    end

    MPI_Finalize()

end

main()

