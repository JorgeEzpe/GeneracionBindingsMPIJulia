using MPI
using LinearAlgebra, Printf

const pi2 = π / 2

function load_data!(box::Vector{Float64}, pos::Matrix{Float64})
    open("box.bin", "r") do io
        read!(io, box)
    end
    open("pos.bin", "r") do io
        read!(io, vec(pos))
    end
end

function v(x::Float64)
    return x < pi2 ? sin(x)^2 : 1.0
end

function dv(x::Float64)
    return x < pi2 ? 2 * sin(x) * cos(x) : 0.0
end

function dot_prod(n::Int, x::AbstractVector{Float64}, y::AbstractVector{Float64})
    t = 0.0
    for i in 1:n
        t += x[i] * y[i]
    end
    return t
end

function dist(nd::Int, r1::AbstractVector{Float64}, r2::AbstractVector{Float64}, dr::Vector{Float64})
    d = 0.0
    for i in 1:nd
        dr[i] = r1[i] - r2[i]
        d += dr[i]^2
    end
    return sqrt(d)
end

function compute(n::Int, nd::Int, pos, vel, f, mass::Float64, rij, procs::Int, rank::Int)
    pot = 0.0
    kin = 0.0

    chunk = n ÷ procs
    i_start = chunk * rank + 1
    i_end = i_start + chunk - 1

    for i in i_start:i_end
        for j in 1:nd
            f[j, i] = 0.0
        end
        for j in 1:n
            if i != j
                d = dist(nd, view(pos, :, i), view(pos, :, j), rij)
                pot += 0.5 * v(d)
                for k in 1:nd
                    d == 0 && (d = 1e-15)
                    f[k, i] -= rij[k] * dv(d) / d
                end
            end
        end
        kin += dot_prod(nd, view(vel, :, i), view(vel, :, n))
    end

    MPI.Allreduce!(Ref(pot), Ref(pot), MPI.SUM, MPI.COMM_WORLD)
    MPI.Allreduce!(Ref(kin), Ref(kin), MPI.SUM, MPI.COMM_WORLD)

    MPI.Allgather!(view(f, :, i_start:i_end), f, MPI.COMM_WORLD)

    kin *= 0.5 * mass
    return pot, kin
end

function update(n::Int, nd::Int, pos, vel, f, a, mass::Float64, dt::Float64, procs::Int, rank::Int)
    rmass = 1.0 / mass
    chunk = n ÷ procs
    i_start = chunk * rank + 1
    i_end = i_start + chunk - 1

    for i in i_start:i_end
        for j in 1:nd
            pos[j, i] = pos[j, i] + vel[j, i] * dt + 0.5 * dt^2 * a[j, i]
            vel[j, i] += 0.5 * dt * (f[j, i] * rmass + a[j, i])
            a[j, i] = f[j, i] * rmass
        end
    end

    MPI.Allgather!(view(pos, :, i_start:i_end), pos, MPI.COMM_WORLD)
    MPI.Allgather!(view(vel, :, i_start:i_end), vel, MPI.COMM_WORLD)
    MPI.Allgather!(view(a, :, i_start:i_end), a, MPI.COMM_WORLD)
end

function md(n::Int, steps::Int)::Tuple{Float64, Int}

    total_time_sum = Ref{Cdouble}(0.0)
    p=-1
    t=0.0

    MPI.Init()
    comm = MPI.COMM_WORLD
    rank = MPI.Comm_rank(comm)
    procs = MPI.Comm_size(comm)

    n = (n % procs != 0) ? ceil(Int, n / procs) * procs : n

    mass = 1.0
    dt = 1.0e-4
    nd = 3

    box = Vector{Float64}(undef, nd)
    position = Matrix{Float64}(undef, nd, n)
    velocity = zeros(Float64, nd, n)
    force = zeros(Float64, nd, n)
    accel = zeros(Float64, nd, n)
    rij = Vector{Float64}(undef, nd)

    if rank == 0
        load_data!(box, position)
    end

    MPI.Barrier(comm)
    t_start = time_ns()

    MPI.Bcast!(position, 0, comm)
    MPI.Bcast!(velocity, 0, comm)
    MPI.Bcast!(force, 0, comm)
    MPI.Bcast!(accel, 0, comm)

    compute(n, nd, position, velocity, force, mass, rij, procs, rank)

    for i in 1:steps
        compute(n, nd, position, velocity, force, mass, rij, procs, rank)
        update(n, nd, position, velocity, force, accel, mass, dt, procs, rank)
    end

    t_end = time_ns()
    total_time=(t_end - t_start)/1e9
    total_time_sum= MPI.Reduce(total_time, MPI.SUM, 0, comm)

    if rank[] == 0
        p=procs
        t=total_time_sum[] / procs
    end

    MPI.Finalize()

    return (t,p)

end

n = parse(Int, ARGS[1])
s = parse(Int, ARGS[2])

t,p=md(n,s)

if p!=-1
    open("../Resultados/MD/MDMPIJL.txt", "a") do file
        write(file,string(p, ",", n, ",", t, "\n"))
    end
end

