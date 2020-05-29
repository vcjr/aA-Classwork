# Phase 1: Modest problems.
# duos
# Write a method duos that accepts a string as an argument and returns 
# the count of the number of times the same character appears consecutively 
# in the given string.

def duos(string)
    count = 0
    string.each_char.with_index { |char, idx| count += 1 if string[idx] == string[idx + 1] }
    count
end

# Examples

# p duos('bootcamp')      # 1
# p duos('wxxyzz')        # 2
# p duos('hoooraay')      # 3
# p duos('dinosaurs')     # 0
# p duos('e')             # 0

# sentence_swap
# Write a method sentence_swap that accepts a sentence and a hash as arguments. 
# The method should return a new sentence where every word is replaced with it's 
# corresponding value in the hash. If a word does not exist as a key of the hash, 
# then it should remain unchanged.

def sentence_swap(sentence, hash)
    new_sen = sentence.split(" ").map do |word|
         if hash.has_key?(word)
            hash[word]
         else
            word
         end
    end

    new_sen.join(" ")
end

# # Examples

# p sentence_swap('anything you can do I can do',
#     'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
# ) # 'nothing you shall drink I shall drink'

# p sentence_swap('what a sad ad',
#     'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
# ) # 'make a happy ad'

# p sentence_swap('keep coding okay',
#     'coding'=>'running', 'kay'=>'pen'
# ) # 'keep running okay'

# hash_mapped
# Write a method hash_mapped that accepts a hash, a proc, and a block. 
# The method should return a new hash where each key is the result of the 
# original key when given to the block. Each value of the new hash should 
# be the result of the original values when passed into the proc.

def hash_mapped(hash, prc, &block)
    new_hash = {}
    
    hash.each do |k, v|
        new_hash[block.call(k)] = prc.call(v)
    end
    
    new_hash
end

# Examples

# double = Proc.new { |n| n * 2 }
# p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# # {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

# first = Proc.new { |a| a[0] }
# p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# # {25=>"q", 36=>"w"}

# counted_characters
# Write a method counted_characters that accepts a string as an argument. 
# The method should return an array containing the characters of the string 
# that appeared more than twice. The characters in the output array should 
# appear in the same order they occur in the input string.

def counted_characters(sentence)
    array = []


    sentence.each_char.with_index do |char, idx|
        count = 1
        sentence.each_char.with_index do |char2, idx2|
            if idx2 > idx && char == char2
                count += 1
                array << char if !array.include?(char) && count > 2
            end
        end
    end

    array
end

# Examples

# p counted_characters("that's alright folks") # ["t"]
# p counted_characters("mississippi") # ["i", "s"]
# p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
# p counted_characters("runtime") # []

# triplet_true?
# Write a method triplet_true? that accepts a string as an argument and 
# returns a boolean indicating whether or not the string contains three of 
# the same character consecutively.

def triplet_true(string)
    count = 0
    string.each_char.with_index { |char, idx| count += 1 if string[idx] == string[idx + 1] }
    count >= 3 ? true : false
end

# Examples

# p triplet_true('caaabb')        # true
# p triplet_true('terrrrrible')   # true
# p triplet_true('runninggg')     # true
# p triplet_true('bootcamp')      # false
# p triplet_true('e')             # false

# energetic_encoding
# Write a method energetic_encoding that accepts a string and a hash as arguments. 
# The method should return a new string where characters of the original string are 
# replaced with the corresponding values in the hash. If a character is not a key of 
# the hash, then it should be replaced with a question mark ('?'). Space characters (' ') 
# should remain unchanged.

def energetic_encoding(sentence, hash)
    new_sen = "" 
    sentence.each_char do |char|
        if hash.has_key?(char)
            new_sen += hash[char]
        elsif char == " "
           new_sen += " "  
        else
            new_sen += "?"
         end
    end

    new_sen
end

# # Examples

# p energetic_encoding('sent sea',
#     'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
# ) # 'zimp ziu'

# p energetic_encoding('cat',
#     'a'=>'o', 'c'=>'k'
# ) # 'ko?'

# p energetic_encoding('hello world',
#     'o'=>'i', 'l'=>'r', 'e'=>'a'
# ) # '?arri ?i?r?'

# p energetic_encoding('bike', {}) # '????'

# # uncompress
# Write a method uncompress that accepts a string as an argument. The string will be 
# formatted so every letter is followed by a number. The method should return an "uncompressed" 
# version of the string where every letter is repeated multiple times given based on the number 
# that appears directly after the letter.

def uncompress(str)
    new_sent = ""    

    str.each_char.with_index do |char, idx|
        if idx.even?
            new_sent += str[idx] * str[idx + 1].to_i # "a" * 3 
        end
    end
    new_sent
end

# Examples

# p uncompress('a2b4c1') # 'aabbbbc'
# p uncompress('b1o2t1') # 'boot'
# p uncompress('x3y1x2z4') # 'xxxyxxzzzz'

# conjunct_select
# Write a method conjunct_select that accepts an array and one or more procs as arguments. 
# The method should return a new array containing the elements that return true when passed 
# into all of the given procs.

def conjunct_select(array, *prcs)
    # length = prcs.length
    # count = 0
    # ele_hash = Hash.new(0)

    # array.each do |ele|
    #     prcs.each { |proc| ele_hash[ele] += 1 if proc.call(ele) }
    # end
    # new_array = ele_hash.select { |k, v| k if v == length }

    new_array = []
    array.each { |ele| new_array << ele if prcs.all? {|proc| proc.call(ele)} }
    new_array
    # new_array.keys
end

# Examples

is_positive = Proc.new { |n| n > 0 }
is_odd = Proc.new { |n| n.odd? }
less_than_ten = Proc.new { |n| n < 10 }

# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]

# convert_pig_latin
# Write a method convert_pig_latin that accepts a sentence as an argument. The method 
# should translate the sentence according to the following rules:

# words that are shorter than 3 characters are unchanged
# words that are 3 characters or longer are translated according to the following rules:
# if the word begins with a vowel, simply add 'yay' to the end of the word (example: 'eat'->'eatyay')
# if the word begins with a non-vowel, move all letters that come before the word's first vowel to the 
# end of the word and add 'ay' (example: 'trash'->'ashtray')
# Note that if words are capitalized in the original sentence, they should remain capitalized in the 
# translated sentence. Vowels are the letters a, e, i, o, u.

# Examples

def convert_pig_latin(sent)
    sent.split(" ").map {|word| convert(word)}.join(" ")
end

def convert(word)
    vowels = "AEIOUaeiou"
    first_letter = word[0]
    new_word = ""
    first_vowel = nil
    
    return word if word.length < 3

     if vowels.include?(first_letter) 
        new_word += word + "yay" 
     else
        word.each_char.with_index do |char, idx|
            if vowels.include?(char)
                first_vowel = idx
                if first_letter == first_letter.upcase
                    left = word[first_vowel].upcase + word[(first_vowel + 1)..-1]
                else
                    left = word[first_vowel..-1]
                end
                right = word[0...first_vowel].downcase # [0]
                new_word = left + right + "ay"
                break
            end
        end
    end
    new_word
end

# p convert("bananas")
# p convert("eat")

# p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
# p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
# p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
# p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
# p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"""

# reverberate
# Write a method reverberate that accepts a sentence as an argument. The method should translate the 
# sentence according to the following rules:

# words that are shorter than 3 characters are unchanged
# words that are 3 characters or longer are translated according to the following rules:
# if the word ends with a vowel, simply repeat the word twice (example: 'like'->'likelike')
# if the word ends with a non-vowel, repeat all letters that come after the word's last vowel, including the 
#     last vowel itself (example: 'trash'->'trashash')
# Note that if words are capitalized in the original sentence, they should remain capitalized in the translated 
# sentence. Vowels are the letters a, e, i, o, u.

# Examples
def reverberate(sent)
    sent.split(" ").map {|word| reverb_convert(word)}.join(" ")
end

def reverb_convert(word)
    vowels = "AEIOUaeiou"
    last_letter = word[-1]
    new_word = ""
    last_vowel = nil
    first_letter = word[0]
    
    return word if word.length < 3

    if vowels.include?(last_letter) 
            if first_letter == first_letter.upcase
                new_word = (word * 2).capitalize
            else   
                new_word = (word * 2)
            end
    else
        (word.length - 1).downto(0).each do |i|
            if vowels.include?(word[i])
                last_vowel = i
                new_word = word + word[i..-1]
                break
            end
        end
    end
    new_word
end

# p reverb_convert("like")
# p reverb_convert("running")

# p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
# p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
# p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
# p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"

# disjunct_select
# Write a method disjunct_select that accepts an array and one or more procs as arguments. 
# The method should return a new array containing the elements that return true when passed 
# into at least one of the given procs.
def disjunct_select(array, *prcs)
    new_array = []
    array.each { |ele| new_array << ele if prcs.any? {|proc| proc.call(ele)} }
    new_array
end
# Examples

# longer_four = Proc.new { |s| s.length > 4 }
# contains_o = Proc.new { |s| s.include?('o') }
# starts_a = Proc.new { |s| s[0] == 'a' }

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
# ) # ["apple", "teeming"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o
# ) # ["dog", "apple", "teeming", "boot"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o,
#     starts_a
# ) # ["ace", "dog", "apple", "teeming", "boot"]


#################################################################################
# alternating_vowel
# Write a method alternating_vowel that accepts a sentence as an argument. 
# The method should return a new sentence where the words alternate between 
# having their first or last vowel removed. For example:

# the 1st word should be missing its first vowel
# the 2nd word should be missing its last vowel
# the 3rd word should be missing its first vowel
# the 4th word should be missing its last vowel
# ... and so on
# Note that words that contain no vowels should remain unchanged. Vowels are the letters a, e, i, o, u.

# Examples

def first_vowel_remover(word)
    vowels = "AEIOUaeiou"
    new_word = ""
    word.each_char.with_index do |char,idx|
        if vowels.include?(char)
            new_word = word[0...idx] + word[idx + 1 ..-1]
            break
        end
    end
    new_word
end

def last_vowel_remover(word)
    vowels = "aeiouAEIOU"
    new_word = ""
    (word.length - 1).downto(0).each do |idx|
        if vowels.include?(word[idx])
            last_vowel = idx
            new_word = word[0...last_vowel] + word[last_vowel + 1..-1]
            break
        end
    end
    
    new_word
end

def no_vowels?(word)
    vowels = "aeiouAEIOU"; word.split("").any? { |char| vowels.include?(char)}
end

def alternating_vowel(sent)
    words = sent.split(" ")
    new_arr = []

    words.each.with_index do |word, idx| 
        if !no_vowels?(word)
            new_arr << word
        elsif idx.even?
            new_arr << first_vowel_remover(word)
        else
            new_arr << last_vowel_remover(word)
        end  
    end

    new_arr.join(" ")
end

# p no_vowels?("dg")

# p first_vowel_remover("panthers")
# p last_vowel_remover("epic")

# p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
# p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
# p alternating_vowel('code properly please') # "cde proprly plase"
# p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"


#######################################################################################
# silly_talk
# Write a method silly_talk that accepts a sentence as an argument. The method should 
# translate each word of the sentence according to the following rules:

# if the word ends with a vowel, simply repeat that vowel at the end of the word (example: 'code'->'codee')
# if the word ends with a non-vowel, every vowel of the word should be followed by 'b' and 
#     that same vowel (example: 'siren'->'sibireben') word[idx] = "#{e}b#{e}" [s, i, r, ebe, n].
# Note that if words are capitalized in the original sentence, they should remain capitalized in 
# the translated sentence. Vowels are the letters a, e, i, o, u.
def silly_talk(sent)
    words= sent.split(" ")
    new_arr = []
    vowels = "aeiouAEIOU"

    words.each do |word|
        if word[-1] == word[last_vowel(word)] #like
            new_arr << word + word[last_vowel(word)]
        else
            new_word = []
            word.each_char do |char|
                
                if vowels.include?(char)
                    if char == char.capitalize
                        new_word << "#{char}b#{char}".capitalize
                    else
                        new_word << "#{char}b#{char}"
                    end
                else
                    new_word << char
                end               
            end
            new_arr << new_word.join("") 
        end
    end

    new_arr.join(" ")
end

def last_vowel(word)
    vowels = "aeiouAEIOU"
    (word.length - 1).downto(0).each do |idx|
        if vowels.include?(word[idx])
            return idx
        end
    end
    
    nil
end
# Examples

p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
p silly_talk('They can code') # "Thebey caban codee"
p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"

# compress
# Write a method compress that accepts a string as an argument. The method 
# should return a "compressed" version of the string where streaks of consecutive 
# letters are translated to a single appearance of the letter followed by the number 
# of times it appears in the streak. If a letter does not form a streak (meaning that 
# it appears alone), then do not add a number after it.

# Examples
def compress(str)
    new_sent = ""    
    

    count = 1
    str.each_char.with_index do |char, idx|
        if str[idx] == str[idx + 1]
            count += 1
        else
            if count > 1
                new_sent += char + count.to_s
                count = 1
            else
                new_sent += char 
            end          
        end
    end
    new_sent
end

# p compress('aabbbbc')   # "a2b4c"
# p compress('boot')      # "bo2t"
# p compress('xxxyxxzzzz')# "x3yx2z4"

