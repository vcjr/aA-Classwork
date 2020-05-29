# Write a method, union, that accepts any number of arrays as arguments.
# The method should return an array containing all elements of the given arrays.
# .flatten

# def union(*args) 
#     unified = []
#     args.each do |array|
#         array.each {|ele| unified<<ele}
#     end
#     unified
# end

def union(*args)
    args.inject { |all_elements, arr| all_elements + arr }
end
p union(["a", "b"], [1, 2, 3]) # => ["a", "b", 1, 2, 3]
p union(["x", "y"], [true, false], [20, 21, 23]) # => ["x", "y", true, false, 20, 21, 23]
