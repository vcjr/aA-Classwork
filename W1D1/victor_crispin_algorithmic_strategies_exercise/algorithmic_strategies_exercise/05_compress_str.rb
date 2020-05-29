# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".
# hash.keys .values

# arr[0] = a [1] = a  [2] = a
# streak = 3
#arr[idx + 1] [3] = b
def compress_str(str)
    new_string = ""
    streak = 1
    str.each_char.with_index do |char,idx|
        if str[idx] == str[idx+1]
            streak += 1
        else
            if streak == 1
                new_string += "#{char}" # streal
            else
                new_string += "#{streak}#{char}" #
                streak = 1
            end
        end
    end
    new_string
end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
