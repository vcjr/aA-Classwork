class Item
    

    def self.valid_date?(string)
        # string "2019-10-25"-.split("-") time[0] year time[1] moth
        parts = string.split("-")
        year = parts[0].to_i
        month = parts[1].to_i
        day = parts[-1].to_i

        return false if !(month > 0 && month < 13)# 
        return false if !(day > 0 && day < 32)
        return false if year.to_s.length != 4
        true
    end

    attr_accessor :title, :deadline, :description

    def initialize(title, deadline, description)
        @title = title
        @deadline = deadline
        @description = description

        if !Item.valid_date?(@deadline)
            raise "ERROR: Not a Valid Deadline"
        end
    end

    def deadline=(new_deadline)
        if !Item.valid_date?(new_deadline)
            raise "ERROR: Not a Valid Deadline"
        else
            @deadline = new_deadline
        end
    end
end



# p Item.valid_date?('2019-10-25') # true
# p Item.valid_date?('1912-06-23') # true
# p Item.valid_date?('2018-13-20') # false
# p Item.valid_date?('2018-12-32') # false
# p Item.valid_date?('10-25-2019') # false


#################################################
# Item#initialize(title, deadline, description)
# This method should accept a title, deadline, and a description as arguments. 
# These three pieces of data should be stored as instance variables of an Item. 
# If the deadline is not a valid date, raise an error.

# For example, here are examples of two items being created successfully and one invalid item:

# p Item.new('Fix login page', '2019-10-25', 'The page loads too slow.')

# p Item.new(
#     'Buy Cheese',
#     '2019-10-21',
#     'We require American, Swiss, Feta, and Mozzarella cheese for the Happy hour!'
# )

# p Item.new(
#     'Fix checkout page',
#     '10-25-2019',
#     'The font is too small.'
# ) # raises error due to invalid date