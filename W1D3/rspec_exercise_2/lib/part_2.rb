def palindrome?(str)
    str.each_char.with_index do |char, idx|
      return false if str[idx] != str[-1 - idx]  
    end
    true
end

def substrings(str)
    i = 0
    subs = []
    while str.length > i
        str.each_char.with_index do |char, idx|
            if idx >= i
                subs << str[i..idx]
            end
        end
        i += 1
    end
    subs
end

def palindrome_substrings(str)
    sub = substrings(str)
    new_arr = []

    sub.each do |ele|
        if palindrome?(ele) && ele.length > 1
            new_arr << ele
        end
    end
    
    new_arr
end