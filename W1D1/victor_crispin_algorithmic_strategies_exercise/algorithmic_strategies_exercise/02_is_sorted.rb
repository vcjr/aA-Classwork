# Write a method, is_sorted(arr), that accepts an array of numbers as an arg.
# The method should return true if the elements are in increasing order, false otherwise.
# Do not use the built-in Array#sort in your solution :)

def is_sorted(arr) # .with_index 
    arr.each_with_index do |num, idx|
        if idx < arr.length - 1
            return false if arr[idx] > arr[idx + 1]
        end
    end
    true
end

p is_sorted([1, 4, 10, 13, 15])       # => true
p is_sorted([1, 4, 10, 10, 13, 15])   # => true
p is_sorted([1, 2, 5, 3, 4 ])         # => false
