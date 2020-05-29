def zip(*arrays)
    new_arr = []
    length = arrays[0].length

    (0...length).each do |i|
        temp = []
        arrays.each { |array|  temp << array[i] }
        new_arr << temp
    end

    new_arr
end

# def zip(*arrays)
#     length = arrays.first.length
#     p "Starting the outer loop ..."
#     result = (0...length).map do |i|
#         p "Starting the inner loop: right now, the index is #{i}."
#         element = arrays.map { |array| array[i] }
#         p "The return value for this element was #{element}"
#         p "------------"
#         element
#     end
#     p "Finished with the outer loop!"
#     return result
# end



def prizz_proc(array, proc_1, proc_2)
    array.select { |ele| proc_1.call(ele) ^ proc_2.call(ele) }
end

# require "byebug"

# def zany_zip(*arrays)
#     width = arrays.map(&:size).max
#     height = arrays[0].length
#     new_arr = Array.new(width ) { Array.new(height, nil) }
#     debugger
#     arrays.each do |array|
#         (0...height).each do |col|
#             (0...width).each do |row|
#                 new_arr[col][row] = array[col][row]
#             end
#         end 
#     end
#     new_arr
# end

def zany_zip(*arrays)
    longest_length = arrays.map(&:size).max
    new_arr = Array.new()

    (0...longest_length).each do |idx|
        sub_arr = []

        arrays.each do |array|
            sub_arr << array[idx]
        end
        new_arr << sub_arr
    end

    new_arr
end

def maximum(arr, &prc)
    return nil if arr.length == 0

    arr.inject do |max, num|
        if proc.call(num) >= proc.call(max)
            max = num
        else
            max
        end
    end
end

def my_group_by(array,&prc)
    hash = Hash.new() { |h, k| h[k] = [] }

    array.each do |ele|
        hash[prc.call(ele)] << ele
    end

    hash
end

# let(:length) { Proc.new { |s| s.length } }
# let(:o_count) { Proc.new { |s| s.count('o') } }
# max_tie_breaker(array_1, length, &o_count)
# max_tie_breaker(array_2, o_count, &length)

# length = Proc.new { |s| s.length }
# o_count = Proc.new { |s| s.count('o') }

#require "byebug"
def max_tie_breaker(array, prc, &block)

    return nil if array.length == 0
    result = array[0]

    # array.inject do |max, ele|
    #     #debugger
    #     if block.call(ele) > block.call(max)
    #         max = ele
    #     elsif block.call(ele) == block.call(max)
    #         if prc.call(ele) > prc.call(max)
    #             max = ele
    #         end
    #     else
    #         max
    #     end
    # end
    array.each do |ele|
        result_ele = block.call(ele)
        result_max = block.call(result)

        if result_ele > result_max 
            result = ele
        elsif result_ele == result_max
            if proc.call(ele) > proc.call(result)
                result = ele
            end
        end
    end

    result
end

def vowel_count(word)
    count = 0
    vowels = "aeiou"
    word.each_char { |char| count += 1 if vowels.include?(char) }
    count
end

def vowel_remover(word)
    vowels = "aeiou"
    new_word = ""
    first_vowel = 0
    last_vowel = 0

    word.each_char.with_index do |char, idx|
        if vowels.include?(char)
            first_vowel = idx
            break
        end
    end

    (word.length - 1).downto(0).each.with_index do |idx|
        if vowels.include?(word[idx])
            last_vowel = idx
            break
        end
    end
    word[first_vowel..last_vowel]
end

# p vowel_remover("heloowad")

def silly_syllables(sent)
    words = sent.split(" ")
    array = []

    words.each do |word|
        if vowel_count(word) >= 2
            array << vowel_remover(word)
        else
            array << word
        end
    end
    array.join(" ")
end