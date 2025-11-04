export getdigits, touppercase, firstnorm, secondnorm, infnorm, isleap, chesscolor

function getdigits(a)
    temp = [];
    b = a;

    while (b / 10) > 1
        push!(temp, b % 10);
        b = b ÷ 10;
    end

    push!(temp, b);
    return temp[end:-1:1];
end

function touppercase(str_)
    temp = [];

    for char in str_

        if (char >= 'a') && (char <= 'z')
            push!(temp, char + ('A' - 'a'));
        else
            push!(temp, char);
        end

    end

    return join(temp);
end

function firstnorm(vec_::AbstractVector{<:Number})
    sum = 0;

    for number in vec_
        sum += abs(number);
    end

    return sum;
end

function secondnorm(vec_::AbstractVector{<:Number})
    sum = 0;

    for number in vec_
        sum += number ^ 2;
    end

    return sqrt(sum);
end

function infnorm(vec_::AbstractVector{<:Number})
    sum = 0;

    for number in vec_
        if number > sum
            sum = number;
        end
    end

    return sum;
end

function firstnorm(mat_::AbstractMatrix{<:Number})
    result = 0;

    for column in eachcol(mat_)
        temp = 0

        for cell in column
            temp += cell;
        end

        result = result < temp ? temp : result;
    end

    return result;
end

function infnorm(mat_::AbstractMatrix{<:Number})
    result = 0;

    for column in eachrow(mat_)
        temp = 0

        for cell in column
            temp += cell;
        end

        result = result < temp ? temp : result;
    end

    return result;
end

function isleap(year)
    if (year % 400) == 0 || (year % 4) == 0
        return true;
    end

    return false;
end

function chesscolor(cell1, cell2)
    cell_1_row = cell1[1] - 'a' + 1;
    cell_1_column = cell1[2];

    cell_2_row = cell2[1] - 'a' + 1;
    cell_2_column = cell2[2];

    if ((cell_1_row + cell_1_column + cell_2_row + cell_2_column) % 2) == 0
        return true;
    end

    return false;
end
