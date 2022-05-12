function push_to_domain!(x::Vector{<:Number}, domain::Matrix{<:Number})
    @assert size(x)[1] == size(domain)[1]
    for (i, (v, low, high)) in enumerate(zip(x, domain[:, 1], domain[:, 2]))
        x[i] = clamp(v, low, high)
    end
end

function push_to_domain(x::Vector{<:Number}, domain::Matrix{<:Number})
    x̃ = copy(x)
    push_to_domain!(x̃, domain)
    return x̃
end

function generate_vector_in_area(domain::Matrix{<:Number})
    ω = domain[:, 2] - domain[:, 1]
    x = domain[:, 1] + rand(size(domain)[1]) .* ω
    return x
end
