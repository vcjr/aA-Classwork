require_relative "Item"
# require "byebug"

class List
    attr_accessor :label
    attr_reader :items

    def initialize(label)
        @label = label
        @items = []
    end
    
    def add_item(title, deadline, description = "")
        return false if !Item.valid_date?(deadline)

        item = Item.new(title, deadline, description)
        @items << item
        true
    end
    
    def list
        @items.length
    end
    
    def valid_index?(index)

        # index > (@items.length - 1) || index < 0 ? false : true

        @items.each_with_index do |ele, idx|
            if ((index < 0) || (index > @items.length - 1))
                return false
            end
        end
        true
    end

    def swap(index_1, index_2)
        if (self.valid_index?(index_1) && self.valid_index?(index_2)) == false
            return false
        else
            @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
            true
        end
    end

    def [](index)
        if self.valid_index?(index)
            @items[index]
        else
            return nil
        end
    end

    def size
        @items.length
    end

    def priority
        @items[0]
    end

    def print    
        puts "------------------------------------------"#.ljust(@item.max.title.length)
        puts "               GROCERIES                  "#.ljust(@item.title.length)
        puts "------------------------------------------"#.ljust(@item.title.length)
        puts "Index | Item                 | Deadline   "#.ljust(@item.title.length)
        puts "------------------------------------------"#.ljust(@item.title.length)
        @items.each_with_index do |item, i| 
            puts "#{i}     | #{item.title}".ljust(29," ") + "| #{item.deadline}"
        end
        puts "------------------------------------------"
    end

    def print_full_item(index) # @items[index]
        if self.valid_index?(index)

            puts "------------------------------------------"
            puts "#{@items[index].title}                 #{@items[index].deadline}"
            puts "#{@items[index].description}"
            puts "------------------------------------------"
            
        end
    end
    def print_priority
        self.print_full_item(0)
    end

    def up(index, amount = 1)
        amount.times do
            if index != 0 && self.valid_index?(index)
                self.swap(index, index - 1)
                index -= 1
                # @items[index], @items[index - 1] = @items[index - 1], @items[index]
            else 
                return false
            end
        end
        true
    end
    # arr[idx], arr[idx-1] = arr[idx-1], arr[idx]

    def down(index, amount = 1)
        while amount != 0
            if index != (@items.length - 1)
                # debugger
                self.swap(index, index + 1)
                index += 1
                # @items[index], @items[index + 1] = @items[index + 1], @items[index]
            end
            amount -= 1
        end

        return true
    end
    def sort_by_date! # item =
        @items.sort_by! do |item|
            item.deadline
        end
            
    end


end
# l = List.new('Groceries')
# l.add_item('cheese', '2019-10-25')
# l.add_item('toothpaste', '2019-10-25')
# l.add_item('shampoo', '2019-10-24')
# l.add_item('candy', '2019-10-31')

# p l.sort_by_date!
# p l.print
# l.print
# l.down(0)
# l.print
# l.down(0, 2)
# l.print
# l.up(3, 10)
# l.print
# l.up(7, 3)
#  my_list = List.new("App Academy TODO")
#  my_list.add_item("Homework", "2020-10-11", "W2D5 Class methods and etc.") # 0
#  my_list.add_item("Assessment", "2020-10-22", "Something test testtttttt") # 1
#  my_list.add_item("Students", "2020-10-12", "Blah blah bla test") # 2
#  my_list.add_item("Project", "2020-9-15", "test test test") # 3
#  my_list.print

# p my_list.up(3, 2)
# p my_list.print
#  my_list.print_full_item(2)
# my_list.print_priority

# p my_list.valid_index?(2)
# p my_list.list
# p my_list.items
#  my_list.swap(0, 1)
# p "--------------"
# p my_list.items[0]
# p my_list.items[1]
# my_list.print

# p my_list[0] # should return nil
# p my_list.priority
# my_list.print_priority