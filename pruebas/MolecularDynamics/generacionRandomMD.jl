using Random

function generate_md(n::Int, seed::Int, procs::Int)

    if n % procs != 0
        n = ceil(Int, n / procs) * procs
    end
    
    nd = 3
    rng = MersenneTwister(seed)

    box = fill(10.0, nd)

    pos = zeros(Float64, nd, n)

    for i in 1:n
        for j in 1:nd
            pos[j, i] = box[j] * rand(rng)
        end
    end

    open("box.bin", "w") do io
        write(io, box)
    end

    open("pos.bin", "w") do io
        write(io, vec(pos))
    end

end

n = parse(Int, ARGS[1])
seed = parse(Int, ARGS[2])
p= parse(Int, ARGS[3])


generate_md(n,seed,p)
