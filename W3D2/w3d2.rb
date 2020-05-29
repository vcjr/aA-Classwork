# Exercise 1 - sum_to
# Write a function sum_to(n) that uses recursion to calculate the sum from 1 to n (inclusive of n).

def sum_to(n)
    return nil if n < 0 
    return 1 if n == 1

    sum_to(n - 1) + n
end

#   # Test Cases
# p  sum_to(5)  # => returns 15
# p  sum_to(1)  # => returns 1
# p  sum_to(9)  # => returns 45
# p  sum_to(-8)  # => returns nil

# Exercise 2 - add_numbers
# Write a function add_numbers(nums_array) that takes in an array of Integers and 
# returns the sum of those numbers. Write this method recursively.

    def add_numbers(num_array)
        
        return num_array[0] if num_array.length <= 1

        current = num_array.pop
        add_numbers(num_array) + current
    end

  # Test Cases
 p add_numbers([1,2,3,4]) # => returns 10
 p add_numbers([3]) # => returns 3
 p add_numbers([-80,34,7]) # => returns -39
 p add_numbers([]) # => returns nil


    def quicksort(array)
        return array.dup if array.length <= 1

        pivot = array.first
        left = array.drop(1).select { |ele| ele < pivot }
        right = array.drop(1).select { |ele| ele >= pivot }
        
        sorted_left = quicksort(left)
        sorted_right = quicksort(right)

        sorted_left + [pivot] + sorted_right
    end

    # p quicksort([11,324,25,36,54,76,8,5,67,4,56,63,45,2,5,4364,57,6,8,4,653,45,42,523,42,4,53,65,46,4])

# Exercise 3 - Gamma Function
# Let's write a method that will solve Gamma Function recursively. 
# The Gamma Function is defined Γ(n) = (n-1)!.

    def gamma_fnc(n)
       return nil if n == 0
       return 1 if n == 1
       
       
    end

  # Test Cases
  gamma_fnc(0)  # => returns nil
  gamma_fnc(1)  # => returns 1
  gamma_fnc(4)  # => returns 6
  gamma_fnc(8)  # => returns 5040