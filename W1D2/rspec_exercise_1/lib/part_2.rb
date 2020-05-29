# def hipsterfy(word)
#     vowels = "aeiou"

#     word.each.reverse do |i|
#         if vowels.include?(word[i])
#             return word[0...i] + word[i + 1..-1]
#         end
#     end

#     word
# end
require "byebug"

def hipsterfy(word)
    vowels = "aeiou"

    i = word.length - 1
    while i >= 0
        if vowels.include?(word[i])
            return word[0...i] + word[i + 1..-1]
        end

        i -= 1
    end

    word
end

def vowel_counts(string)
    vowels = "aeiou"
    result = Hash.new(0)

    string.downcase.each_char do |char|
       result[char] += 1 if vowels.include?(char)
    end

    result
end



def caesar_cipher(str, n)
    alpha = ("a".."z").to_a
    encrypted = ""

    str.each_char do |char|

        if alpha.include?(char)
            current_idx = alpha.index(char)
            new_idx = current_idx + n
            encrypted += alpha[new_idx % 26]
        else
            encrypted += char
        end
    end

    encrypted
end
