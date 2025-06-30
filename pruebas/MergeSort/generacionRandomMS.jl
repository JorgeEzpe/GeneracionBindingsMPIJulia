using Random

function generate_vector(n::Int, seed::Int, procs::Int)

    if n % procs != 0
        n = ceil(Int, n / procs) * procs
    end

    rng = MersenneTwister(seed)
    v = Vector{Float64}(undef, n)

    for i in 1:n
        v[i] = rand(rng) * 2000.0 - 1000.0
    end

    open("random_vector.bin", "w") do io
        write(io, v)
    end
end

n = parse(Int, ARGS[1])
seed = parse(Int, ARGS[2])
p= parse(Int, ARGS[3])

generate_vector(n, seed,p)