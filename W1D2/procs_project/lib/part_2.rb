def reverser(str, &prc)
    prc.call(str.reverse)
end

def word_changer(str, &prc)
    sentence = []

    str.split(" ").each { |word| sentence << prc.call(word) }

    sentence.join(" ")
end

def greater_proc_value(n, proc1, proc2)
    if proc1.call(n) > proc2.call(n)
        return proc1.call(n) 
    else
        return proc2.call(n)
    end
end

def and_selector(arr, proc1, proc2)
    selected = []

    arr.each do |ele|
       selected << ele if proc1.call(ele) == true && proc2.call(ele) == true
    end

    selected
end

def alternating_mapper(arr, proc1, proc2)
    result = []

    arr.each_with_index do |ele, i|
        if i % 2 == 0
            result << proc1.call(ele)
        else
            result << proc2.call(ele)
        end

        # if i % 2 == 0 ?  result << proc1.call(ele) : result << proc2.call(ele);
        
    end


    result
end