require "byebug"
# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  
    def span
        if self.all? { |ele| ele.class == Integer } && !self.empty?
            self.max - self.min
        elsif self.empty?
            nil
        end
    end

    def average
        if self.all? { |ele| ele.class == Integer || ele.class == Float } && !self.empty?
            (self.sum.to_f / self.length.to_f)
        elsif self.empty?
            nil
        end   
    end

    def median 
        # debugger
        if self.all? { |ele| ele.class == Integer || ele.class == Float } && !self.empty?
            sorted = self.sort
            if sorted.length.even? # [5, 0, 2, 6, 11, 10 , 9] -> [0, 2, 5, 6, 9, 10, 11] length = (7 / 2).floor = 3
                right_idx = (sorted.length /  2) # [3, 4, 5, 8] length = (4 / 2) idx = 2 
                left_idx = (sorted.length /  2) - 1 # idx 1
                (sorted[right_idx].to_f + sorted[left_idx].to_f) / 2
            else
                middle_idx = (sorted.length /  2).floor
                sorted[middle_idx]
            end
        elsif self.empty?
            nil
        end   
    end

    def counts
        count = Hash.new(0)
        self.each {|ele| count[ele] += 1 }
        count
    end

    def my_count(ele)
        count = 0
        self.each {|item| count += 1 if item == ele}
        count
    end

    def my_index(ele)
        idx = nil
        self.each_with_index do |item, idx2|
            if item == ele
                idx = idx2
                break 
            end 
        end
        idx
    end

    def my_uniq
        new_arr = []
        self.each do |ele|
            if !new_arr.include?(ele)
                new_arr << ele
            end
        end
        new_arr
    end
    
    def my_transpose
        transposed = []

        (0...self.length).each do |row|
            new_row = []

            (0...self.length).each { |col| new_row << self[col][row] }

            transposed << new_row
        end

        transposed
    end
end

# [["w", "x"], [0][0], [0][1]
# ["y", "z"]]  [1][0], [1][1] 

# [["w", "y"], [0][0], [1][0]
# ["x", "z"]] [0][1], [1][1]

# For 2D array of lenth of 2 you swap

