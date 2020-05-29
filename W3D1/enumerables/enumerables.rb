
# Shift + Alt + upkey 
# alt + upkey 
# alt + downkey
# ctr + alt + up or down

class Array
    
    # My Each
    # Extend the Array class to include a method named my_each that takes a block, calls the 
    # block on every element of the array, and returns the original array. Do not use Enumerable's 
    # each method. I want to be able to write:
    # calls my_each twice on the array, printing all the numbers twice.

    # # Example we run 
    # return_value = [1, 2, 3].my_each do |num|
    #     puts num
    #   end.my_each do |num|
    #     puts num
    # end
    # #   # => 1
    # #        2
    # #        3
    # #        1
    # #        2
    # #        3
    
    #   p return_value  # => [1, 2, 3]

    def my_each(&prc)
        i = 0
        while i < self.length  # b/c this is called on an instance, "self" here refers to an instance
            prc.call(self[i])
            i += 1
        end
        self
    end

    # My Select
    # Now extend the Array class to include my_select that takes a block and 
    # returns a new array containing only elements that satisfy the block. Use 
    # your my_each method!

    # # Example:
    # a = [1, 2, 3]
    # p a.my_select { |num| num > 1 } # => [2, 3]
    # p a.my_select { |num| num == 4 } # => []
    

    def my_select(&prc)
        newarr = []
        self.my_each { |ele| newarr << ele if prc.call(ele) }
        newarr
    end 

    # My Reject
    # Write my_reject to take a block and return a new array excluding 
    # elements that satisfy the block.

    # # Example:
    # a = [1, 2, 3]
    # p a.my_reject { |num| num > 1 } # => [1]
    # p a.my_reject { |num| num == 4 } # => [1, 2, 3]

    def my_reject(&prc)
        newarr = []
        self.my_each { |ele| newarr << ele if !prc.call(ele) }
        newarr
    end

    # My Any
    # Write my_any? to return true if any elements of the array satisfy the block and 
    # my_all? to return true only if all elements satisfy the block.

    # Example:
    # a = [1, 2, 3]
    # p a.my_any? { |num| num > 1 } # => true
    # p a.my_any? { |num| num == 4 } # => false
    # p a.my_all? { |num| num > 1 } # => false
    # p a.my_all? { |num| num < 4 } # => true
    
    def my_any?(&prc)
        self.my_each { |ele| return true if prc.call(ele) }
        false
    end
    
    def my_all?(&prc)
        self.my_each { |ele| return false if !prc.call(ele) }
        true
    end

    # My Flatten
    # my_flatten should return all elements of the array into a new, one-dimensional array. 
    # Hint: use recursion!
    
    # Example:
    # p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten 
    # # => [1, 2, 3, 4, 5, 6, 7, 8]
    # The algorith for flatten to see if the ele is an array or not. How? by checking f input is an array then 
    # [1,2,3, 2,3,4,5,5]
    def my_flatten
        arr = []

        self.my_each do |ele|
            if ele.is_a?(Array)
                arr += ele.my_flatten # arr.concat(ele.my_flatten)
            else
                arr << ele
            end
        end
        arr
    end
    
    # My Zip
    # Write my_zip to take any number of arguments. It should return a new array containing self.length elements. 
    # Each element of the new array should be an array with a length of the input arguments + 1 and contain the merged 
    # elements at that index. If the size of any argument is less than self, nil is returned for that location.
    
    # Example:
    # a = [ 4, 5, 6 ]
    # b = [ 7, 8, 9 ]

    # p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
    # p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]

    # p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

    # c = [10, 11, 12]
    # d = [13, 14, 15]

    # p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]

    def my_zip(*arrs) 
        newarr = []
        
        length = self.length

        (0...length).to_a.my_each do |i|
            subArr = []
            subArr << self[i]
            arrs.my_each do  |arr|
                if arr[i] != nil
                    subArr << arr[i]
                else
                    subArr << nil
                end
            end
            newarr << subArr
        end
        newarr
    end

    # My Rotate
    # Write a method my_rotate that returns a new array containing all the elements of the original array in a 
    # rotated order. By default, the array should rotate by one element. If a negative value is given, the array 
    # is rotated in the opposite direction.
    # Example:
    
    # a = [ "a", "b", "c", "d" ]
    # p a.my_rotate         #=> ["b", "c", "d", "a"]
    # p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
    # p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
    # p a.my_rotate(15)     #=> ["d", "a", "b", "c"]
    def my_rotate(num = 1)
        newarr = []
        self.each_with_index do |ele, i|
            newidx = (i + num) % self.length
            newarr << self[newidx]
        end
        newarr
    end
    # My Join
    # my_join returns a single string containing all the elements of the array, separated by the given 
    # string separator. If no separator is given, an empty string is used.
    # a = [ "a", "b", "c", "d" ]
    # p a.my_join         # => "abcd"
    # p a.my_join("$")    # => "a$b$c$d"
    
    # Example:
    def my_join(sep = "")
        str = ""
        self.each_with_index do |ele, i| 
            if i != self.length - 1
                str += (ele + sep)
            else
                str += ele
            end
        end
        str
    end
    
    # My Reverse
    # Write a method that returns a new array containing all the elements of the original array in reverse order.
    
    # Example:
    # p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
    # p [ 1 ].my_reverse               #=> [1]
    
    def my_reverse
        # solution1
        newarr = []
        (self.length - 1).downto(0).each { |i| newarr << self[i] }
        newarr

        # #solution2
        # self.each_with_index do |char, i|
        #     self[self.length - 1 - i]
        # end
        
        # #solution3
        # i = self.length - 1
        # while 

        #     i -= 1
        # end
        
        # # Solution 4
        # self.each { |ele| newarr.unshift(ele)}

    end
end



#factors(num)
#bubble_sort!(&prc)
#bubble_sort(&prc)
#substrings(string)
#subwords(word, dictionary)



