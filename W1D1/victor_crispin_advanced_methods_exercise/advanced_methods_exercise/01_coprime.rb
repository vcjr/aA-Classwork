# Write a method, coprime?(num_1, num_2), that accepts two numbers as args.
# The method should return true if the only common divisor between the two numbers is 1.
# The method should return false otherwise. For example coprime?(25, 12) is true because
# 1 is the only number that divides both 25 and 12.

# def coprime?(num1, num2)
#     if num2 > num1
#         num1, num2 = num2, num1
#     end
#     num1_array = divisor(num1)
#     num2_array = divisor(num2)
#     num1_array.each do |i|
#         return false if num2_array.include?(i)
#     end
    
#     true
# end

# def divisor(num)
#     num_array = []
#     (2..num).each {|i| num_array << i if num % i == 0}
#     num_array
# end

def coprime?(num1, num2)
    (2..num1).none? { |divisor| num1 % divisor == 0 && num2 % divisor == 0 }
end


p coprime?(25, 12)    # => true
p coprime?(7, 11)     # => true
p coprime?(30, 9)     # => false
p coprime?(6, 24)     # => false
