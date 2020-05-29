def is_prime?(n)
    return false if n < 2

    (2...n).each {|factor| return false if n % factor == 0 }

    true
end

def nth_prime(n)
    
    i = 1
    count = 0
    while true #count <= n
       count += 1 if is_prime?(i)
       return i if count == n
       i += 1
    end
end

def prime_range(min, max) 
    (min..max).select { |num| is_prime?(num) }
end