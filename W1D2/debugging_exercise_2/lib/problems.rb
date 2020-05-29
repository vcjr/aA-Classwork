# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def prime?(num)
    return false if num < 2

    (2...num).each { |i| return false if num % i == 0 }

    true
end

def largest_prime_factor(n)
    n.downto(2) do |factor|
        return factor if n % factor == 0 && prime?(factor)
    end
end


def unique_chars?(str)
    char_count = Hash.new(0)

    str.each_char do |char|
        char_count[char] += 1

        return false if char_count[char] >= 2
    end

    true
end

def dupe_indices(arr)
    result = Hash.new { |h, k| h[k] = [] }

    arr.each_with_index do |ele, i|
        result[ele] << i
    end

    result.select {|k, v| v.length >= 2}
end


def ana_array(arr1, arr2)
    h_arr1 = Hash.new(0)
    h_arr2 = Hash.new(0)

    arr1.each {|ele| h_arr1[ele] += 1}
    arr2.each {|ele| h_arr2[ele] += 1}

    h_arr1 == h_arr2
end