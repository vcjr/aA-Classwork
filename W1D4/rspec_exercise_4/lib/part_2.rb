def proper_factors(num)
    (1...num).select { |n| n if num % n == 0 }
end 

def aliquot_sum(num)
    proper_factors(num).sum
end

def perfect_number?(num)
    aliquot_sum(num) == num
end

def ideal_numbers(n)
    arr = []
    i = 1

    while  arr.length != n
        arr << i if perfect_number?(i)

        i += 1
    end

    arr
end