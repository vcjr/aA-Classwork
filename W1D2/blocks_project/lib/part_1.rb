def select_even_nums(array)
    array.select { |ele| ele.even? }
end

def reject_puppies(array)
    array.reject { |hash| hash["age"] <= 2 }
end

def count_positive_subarrays(array)
    array.count { |sub_arr| sub_arr.sum > 0 }
end

def aba_translate(string)
    vowels = "aeiou"
    new_str = ""
    
    string.each_char.with_index do |char, i|
        if vowels.include?(char) 
            new_str += char + "b" + char
        else 
            new_str += char
        end
    end

    new_str
end

def aba_array(array)
    array.map { |ele| aba_translate(ele) }
end