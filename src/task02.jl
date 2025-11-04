function arraysum(ar::AbstractVector{<:Number})::Float64
    sum = 0;

    for number in ar
        sum += number;
    end

    return sum;
end


function mul35sum(N::Integer)::Int64
    result :: Array{Int} = []

    i = 1
    while i < N
        if (i % 3 == 0) || (i % 5 ==0)
            push!(result, i)
        end

        i += 1
    end

    return arraysum(result)
end
