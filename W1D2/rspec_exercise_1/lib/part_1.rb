def average(num_1, num_2)
    sum = num_1 + num_2
    sum / 2.0
end

def average_array(array)
    array.sum / (array.length * 1.0)
end

def repeat(str, num)
    str * num
end

def yell(string)
    string.upcase + "!"
end

def alternating_case(string)
    words = string.split(" ")

    words.map.with_index do |word, i|  
        if i % 2 == 0
            word.upcase!
        else
            word.downcase!
        end 
    end
    words.join(" ")
end
























