require_relative "List"

class TodoBoard
    def initialize(label)
        @list = List.new(label)
    end

    # mktodo <title> <deadline> <optional description>
    # [0]      [1]      [2]         [3]
    
    # up <index> <optional amount>
    # [0]      [1]      [2]         [3]
    
    # quit
    # [0]  
    
    # swap <index_1> <index_2>
    # [0]     [1]       [2]
    def get_command
        puts "Enter a command: "
        cmd, *user_input = gets.chomp.split(" ") # mktodo Homework 2020-05-22 Project
        
        case cmd
        when "mktodo"
            @list.add_item(*user_input)
            
        when "up"
            @list.up(*user_input)
            
        when "down"
            @list.down(*user_input)
            
        when "swap"
            @list.swap(*user_input.map(&:to_i))
            
        when "sort"
            @list.sort_by_date!
            
        when "priority"
            @list.priority
            
        when "print" 
            if user_input.empty? # "print" ""
                @list.print
            else
                @list.print_full_item(user_input.map(&:to_i)) # "print" "3"
            end
            
        when "quit"
            
            return false
            
        else
            puts "Sorry bro that command doesn't work!"
        end
        
        true
    end

    def run
        # puts "Enter a command:" 
        # cmd, *user_input = gets.chomp.split(" ")
        while true
            person = self.get_command 
            if person == false
                return
            end
        end
    end
end
# load 'todo_board.rb'
# my_board = TodoBoard.new('groceries')
# my_board.run
# mktodo cheese 2019-10-25 foooooood
# mktodo toothpaste 2019-10-23
# mktodo candy 2019-10-31 sugar-free
# mktodo shampoo 2019-10-25
# print
# sort
# print
# swap 0 3
# print
# print 1
# priority


# trello = TodoBoard.new("Trello List")

