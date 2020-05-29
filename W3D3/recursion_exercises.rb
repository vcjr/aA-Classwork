# Warmup
# Write a recursive method, range, that takes a start and an end and 
# returns an array of all numbers in that range, exclusive. For example, 
# range(1, 5) should return [1, 2, 3, 4]. If end < start, you can return an empty array.
# Write both a recursive and iterative version of sum of an array.

#Iterative
# def range(num_1, num_2)
#   arr = []
#   return arr if num_2 < num_1
#   (num_1...num_2).each { |i| arr << i }
#   arr
# end

#Recursively

# def range(num_1, num_2)
#     return [] if num_2 < num_1
#     return [num_1] if (num_1...num_2).to_a.length == 1
    
#     [num_1] + range(num_1 + 1, num_2) # 2, 
#     # (2...7)
#     # [2] + range (3...7)
#     # [2, 3] + range (4...7)
#     # [2, 3, 4] + range (5...7)
#     # arr + arr2 # [ ele, ele2]
# end

# p range(2, 7)
# p range(5, 3)

# Exponentiation
# Write two versions of exponent that use two different recursions:

# this is math, not Ruby methods.
# def exp(b, n)
#   return 1 if n == 0
#   p "b = #{b}"
#   p "n = #{n}"
#   p "---"
#   b * exp(b, n - 1)
# end

# p exp(2, 256)

# recursion 1
# exp(b, 0) = 1 # b 2 ^ 0 
# exp(b, n) = b * exp(b, n - 1)

# def exp(b, n)
#   p "b = #{b}"
#   p "n = #{n}"
#   p "---"
#   return 1 if n == 0
#   return exp(b, n / 2) ** 2 if n.even?
#   b * (exp(b, (n - 1) / 2) ** 2) if n.odd?
# end

#

# p exp(2, 16)
# p exp(2, 256)

# recursion 2
# exp(b, 0) = 1
# exp(b, 1) = b
# exp(b, n) = exp(b, n / 2) ** 2             [for even n]
# exp(b, n) = b * (exp(b, (n - 1) / 2) ** 2) [for odd n]

# Deep dup
# The #dup method doesn't make a deep copy:

# robot_parts = [
#   ["nuts", "bolts", "washers"], # [0]
#   ["capacitors", "resistors", "inductors"] # << "LEDS" [1]
# ]

# robot_parts_copy = robot_parts.dup

# class Array

#     def deep_dup
#         arr = []

#         (0...self.length).each do |i|
#             if !self[i].is_a?(Array)
#                 arr += [self[i]] 
#             else
#                arr += [self[i].deep_dup]
#             end
#         end

#         arr
#     end

# end

 
# shouldn't modify robot_parts
# robot_parts_copy[1] << "LEDs"
# # but it does
# robot_parts[1] # => ["capacitors", "resistors", "inductors", "LEDs"]

# Fibonacci
# Write a recursive and an iterative Fibonacci method. The method should 
# take in an integer n and return the first n Fibonacci numbers in an array.

# You shouldn't have to pass any arrays between methods; you should be able to 
# do this just passing a single argument for the number of Fibonacci numbers requested.

# def fibonacci(n)
#   return [] if n== 0
#   return [0] if n == 1
#   return [0, 1] if n == 2
#   last_fib = fibonacci(n - 1)
#   last_num = last_fib[-1] + last_fib[-2]
#   p last_num
#   p "____"
#   last_fib << last_num
# end

# p fibonacci(10)

# Binary Search
# The binary search algorithm begins by comparing the target value to the value of the middle 
# element of the sorted array. If the target value is equal to the middle element's value, 
# then the position is returned and the search is finished. If the target value is less than 
# the middle element's value, then the search continues on the lower half of the array; or if 
# the target value is greater than the middle element's value, then the search continues on the 
# upper half of the array. This process continues, eliminating half of the elements, and comparing
# the target value to the value of the middle element of the remaining elements - until the 
# target value is either found (and its associated element position is returned), or until the 
# entire array has been searched (and "not found" is returned).

# Write a recursive binary search: bsearch(array, target). Note that binary search only works on 
# sorted arrays. Make sure to return the location of the found object (or nil if not found!). 
# Hint: you will probably want to use subarrays.

# Make sure that these test cases are working:


# def bsearch(array, target)
#   return nil if !array.include?(target)
# #   return i if array[i] == target

#     pivot = array.length / 2
#     left = array[0...pivot]
#     right = array[pivot + 1..-1]
#     arr = left + [pivot] 
#     return pivot if array[pivot] == target
    
#     if left.include?(target)
#         bsearch(left, target) 
#     else
#         bsearch(right, target) + arr.length
#     end
    
# end
# Create a new array with pivot plut pivot plus right if its on the right we find the index of the right array


# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

# # [1, 2, 3, 4, 5, 6] 6
# # [4, 5, 6] 6
# # [5, 6]
# # [6] 6


# def merge_sort(arr)
#   return arr if arr.length <= 1

#     pivot = arr.length / 2
#     left = merge_sort(arr[0...pivot]) 
#     right = merge_sort(arr[pivot..-1])

#     merge(left, right)
# end

# def merge(arr1, arr2)
#   if arr1.empty?
#     arr2
#   elsif arr2.empty?
#     arr1
#   elsif arr1[0] < arr2[0]
#     [arr1[0]] + merge(arr1[1..-1], arr2)
#   else
#     [arr2[0]] + merge(arr2[1..-1], arr1)
#   end
# end

# Array Subsets
# Write a method subsets that will return all subsets of an array.
class Array
    def subsets
        return [self] if self.empty?
        subs = [[]]
        (0...self.length).each do |i|
            second_sub << [self[i]]
            
            (i...self.length).each do |j|
                # second_sub << self[j] if j > i
                subs + second_sub
                subs << self[i..j] 
                self[1..-1].subsets
            end

        end

        subs
    end
end

# subsets([]) # => [[]]
# subsets([1]) # => [[], [1]]
# subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# subsets([1, 2, 3]) # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]
# You can implement this as an Array method if you prefer.
# Hint: For subsets([1, 2, 3]), there are two kinds of subsets:

# Those that do not contain 3 (all of these are subsets of [1, 2]).
# For every subset that does not contain 3, there is also a corresponding subset that is the same, except it also does contain 3.