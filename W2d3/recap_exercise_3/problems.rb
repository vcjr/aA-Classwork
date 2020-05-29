require "byebug"
def no_dupes?(arr)
    count = Hash.new(0)
    arr.each do |ele|
        count[ele] += 1
    end
    count.select {|k, v| v == 1}.keys
    
end

# Examples
# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []


def no_consecutive_repeats?(arr)
    (0...arr.length-1).each do |i|
        return false if arr[i] == arr[i+1]
    end
    true
end


# Examples
# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true 



def char_indices(str)
    result = Hash.new() {|h,k| h[k] = Array.new}
    
    str.each_char.with_index do |char, i| 
        result[char] << i
    end
    result 
end



# Examples
# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}


def substrings(str)
    result = []
    (0...str.length).each do |i1|
        (0...str.length).each { |i2| result << str[i1..i2] if i2 >= i1 && str.length > 0 }
    end
    result
end

def same_char(word)
    return false if word == ""
    (0...word.length-1).each { |i| return false if word[i] != word[i+1] }
    true
end

def longest_streak(str)
    sub_strs = substrings(str)
    sub_strs.select {|word| same_char(word) && word.length > 0}.sort_by(&:length).last
end


# p longest_streak('a')           # => 'a'
# p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('aaaxyyyyyzz') # => 'yyyyy
# p longest_streak('aaabbb')      # => 'bbb'
# p longest_streak('abc')         # => 'c'

def bi_prime?(num)
    facts = factors(num)
        facts.each do |factor1|
            facts.each do |factor2|
                if factor1 * factor2 == num
                    return true
                end
            end
        end
    false
end

def factors(num)
    (2..num).select do |i|
        num % i == 0 && prime?(i)
    end
end

def prime?(num)
    (2...num).each do |factor|
        return false if num % factor == 0
    end
    true 
end
            

# Examples
# For Example:

# 14 is a bi-prime because 2 * 7
# 22 is a bi-prime because 2 * 11
# 25 is a bi-prime because 5 * 5
# 24 is not a bi-prime because no two prime numbers have a product of 24
# p bi_prime?(14)   # => true
# p bi_prime?(22)   # => true
# p bi_prime?(25)   # => true
# p bi_prime?(94)   # => true
# p bi_prime?(24)   # => false
# p bi_prime?(64)   # => false
# vigenere_cipher


# vigenere_cipher
# A Caesar cipher takes a word and encrypts it by offsetting each letter in the word by a fixed number
# , called the key. Given a key of 3, for example: a -> d, p -> s, and y -> b.

# A Vigenere Cipher is a Caesar cipher, but instead of a single key, a sequence of keys is used. 
# For example, if we encrypt "bananasinpajamas" with the key sequence 1, 2, 3, then the result would 
# be "ccqbpdtkqqcmbodt":

# Message:  b a n a n a s i n p a j a m a s
# Keys:     1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1
# Result:   c c q b p d t k q q c m b o d t
# Write a method vigenere_cipher(message, keys) that accepts a string and a key-sequence as args, 
# returning the encrypted message. Assume that the message consists of only lowercase alphabetic characters.
def vigenere_cipher(str, arr)
    alpha = ("a".."z").to_a
    # count = 0
    # arr_i = count % arr.length 
    new_str = ""
    str.each_char.with_index do |char, i| #0 1 2
        nxt_char = alpha.index(char) + arr[i % arr.length] # [1, 2, 3] 0, 1, 2 -> i(0) % 3 = 0 -> i(3) % 3 = 
        new_str += alpha[nxt_char % 26]
    end

    new_str
end



# Examples
# p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# p vigenere_cipher("yawn", [5, 1])             # => "dbbo"



def vowel_rotate(str)
    vowels = "aeiou"
    previous_vowel = ""
    
    str.reverse.each_char do |char| # "uoe"
        if vowels.include?(char)
            previous_vowel = char 
            break 
        end
    end

    str.each_char.with_index do |char, i| 
        if vowels.include?(char)
            str[i] = previous_vowel
            previous_vowel = char 
        end
    end
    str 
end

# Examples
# p vowel_rotate('computer')      # => "cempotur"
# p vowel_rotate('oranges')       # => "erongas"
# p vowel_rotate('headphones')    # => "heedphanos"
# p vowel_rotate('bootcamp')      # => "baotcomp"
# p vowel_rotate('awesome')       # => "ewasemo"


class String 

    def select(&prc)
        prc ||= Proc.new {false}
        new_str = ""
        self.each_char do |char|
            new_str += char if prc.call(char)
        end
        new_str
    end

    def map!(&prc)
        i = 0
        while i < self.length  
            self[i] = prc.call(self[i], i)
            i += 1
        end
    end
    # def map!(&prc)
    #     self.each_char.with_index do |char, i|
    #         self[i] = prc.call(char, i)
    #     end
    # end

end

# Examples
# p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
# p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
# p "HELLOworld".select          # => ""

# # Examples
# word_1 = "Lovelace"
# word_1.map! do |ch| 
#     if ch == 'e'
#         '3'
#     elsif ch == 'a'
#         '4'
#     else
#         ch
#     end
# end
# p word_1        # => "Lov3l4c3"

# word_2 = "Dijkstra"
# word_2.map! do |ch, i|
#     if i.even?
#         ch.upcase
#     else
#         ch.downcase
#     end
# end
# p word_2        # => "DiJkStRa" 

# multiply
# Write a method multiply(a, b) that takes in two numbers and returns their product.

def multiply(a, b)
    #base case
    return 0 if a == 0 || b == 0 
    #recursive call 
    
    if b > 0
        multiply(a, b-1) + a 
    else
        multiply(a, b+1) - a 
    end
end

# 3 * 5 = 15
# 3 -> 5 + 5 + 5

# You must solve this recursively (no loops!)
# You must not use the multiplication (*) operator
# Examples
# p multiply(3, 5)        # => 15
# p multiply(5, 3)        # => 15
# p multiply(2, 4)        # => 8
# p multiply(0, 10)       # => 0
# p multiply(-3, -6)      # => 18
# p multiply(3, -6)       # => -18
# p multiply(-3, 6)       # => -18

def lucas_sequence(n)
    # break case
    results = []
    return [] if n == 0
    return [2] if n == 1
    return [2, 1] if n == 2
    
    # recursive call
    arr = lucas_sequence(n-1)
    arr << arr[-2..-1].sum
end
# def lucas_number(n)
#     #base case
#     return 2 if n == 0
#     return 1 if n == 1
#     #recursive call
#     lucas_number(n-1) + lucas_number(n-2)
# end

# p lucas_sequence(0)   # => []
# p lucas_sequence(1)   # => [2]    
# p lucas_sequence(2)   # => [2, 1]
# p lucas_sequence(3)   # => [2, 1, 3]
# p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
# p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]

#                               60
#                               6 10
#                              3 2 2 5
#                                   23 -> 20 2 2 5 3

def prime_factorization(num)
    num2 = num - 1
    # base case (prime numbers)
    arr = []
    arr << [num] if prime_rec(num, num-1) && num % num == 0
    # recursive call
    prime_factorization(num) - num2
end

def prime_rec?(num)
    # base case
    return true if num2 == 1
    return false if num % num2 == 0
    
    # recursive call
    prime_rec?(num, num2-1)
end

# p prime_rec?(2, 1)
# p prime_rec?(7, 6)
# p prime_rec?(11, 10)
# p prime_rec?(4, 3)

prime_factorization(12)     # => [2, 2, 3]
prime_factorization(24)     # => [2, 2, 2, 3]
prime_factorization(25)     # => [5, 5]
prime_factorization(60)     # => [2, 2, 3, 5]
prime_factorization(7)      # => [7]
prime_factorization(11)     # => [11]
prime_factorization(2017)   # => [2017]