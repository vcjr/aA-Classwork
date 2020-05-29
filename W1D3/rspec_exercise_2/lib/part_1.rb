def partition(arr, n)
    parts = [[], []]

    arr.each do |ele|
        if ele < n 
            parts[0] << ele 
        else
            parts[1] << ele
        end
    end
    parts
end

def merge(hash1, hash2)
    merge = {}

    hash2.each { |k,v| merge[k] = v }
    hash1.each { |k,v| merge[k] = v if !hash2.has_key?(k) }

    merge
end

def vowels_replace(word, curses) 
    vowels = "aeiouAEIOU"
    new_word = ""

    word.each_char do |char|
        if curses.include?(word.downcase) 
             if vowels.include?(char)
                new_word += "*"
             else
                new_word += char
             end
        else
            return word
        end
    end
    new_word
end

def censor(set, curses)
    new_set = set.split(" ")
    new_arr = []

    new_set.each do |word|
        new_arr << vowels_replace(word, curses)
    end

    new_arr.join(" ")
end

# 1 2 4 8 

def power_of_two?(num)
    return true if num == 1

    i = 2
    while i <= num
        return true if i == num

        i *= 2
    end
    false
end

