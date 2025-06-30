using Random

function generate_data(n::Int, seed::Int, procs::Int)

    if n % procs != 0
        n = ceil(Int, n / procs) * procs
    end

    rng = MersenneTwister(seed)
    a = Matrix{Float64}(undef, n, n)
    b = Vector{Float64}(undef, n)

    for i in 1:n
        row_sum = 0.0
        for j in 1:n
            a[i, j] = rand(rng)
            row_sum += a[i, j]
        end
        a[i, i] = row_sum           
        b[i] = rand(rng)
    end

    open("a_matrix.bin", "w") do io
        write(io, a)
    end
    open("b_vector.bin", "w") do io
        write(io, b)
    end
end

n = parse(Int, ARGS[1])
s = parse(Int, ARGS[2])
p = parse(Int, ARGS[3])

generate_data(n,s,p)