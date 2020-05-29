# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
def least_common_multiple(num_1, num_2)
    (2..num_1*num_2).each do |i|
        if i % num_1 == 0 && i % num_2 == 0
            return i 
        end
    end
    nil
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    count = Hash.new(0)
    (0...str.length-1).each do |i1|
        count[str[i1..i1+1]] += 1 
    end
    # p count.sort
    arr = count.sort.inject do |acc, ele|
        if ele[1] > acc[1]
            acc = ele
        else
            acc
        end
    end
    arr.first
        
end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        new_hash = {}
        self.each do |k,v|
            new_hash[v] = k
        end
        new_hash
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of 
    #pairs of elements that sum to the given target
    def pair_sum_count(num)
        count = 0
        self.each.with_index do |ele1, i1|
            self.each.with_index do |ele2, i2|
                if i1 > i2 && ele1 + ele2 == num 
                    count += 1
                end
            end
        end
        count
    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    # { |a, b| a.to_s <=> b.to_s }
    def bubble_sort(&prc)
        prc ||= Proc.new {|a, b| a <=> b} 
        sorted = false
        while !sorted 
            sorted = true
            self.each.with_index do |ele1, i1|
                self.each.with_index do |ele2, i2|
                    if i1 < i2 && prc.call(ele1, ele2) == 1
                        sorted = false 
                        self[i1], self[i2], = self[i2], self[i1] 
                    end
                end
             end
        end
        self 
    end
end
