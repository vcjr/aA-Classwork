require "./card.rb"
require "./deck.rb"
require "./board.rb"

# http://www.ruby2d.com/learn/get-started/ -> Give 

class Game

    def initialize(size = 4)
        @size = size
        @board = Board.new(size)

    end

    def get_pos
        puts "Please enter a position -> '3 4'"

        input = gets.chomp.split(" ")

        input.map!(&:to_i) if input.length == 2
        
        if self.valid?(input)
            return input 
        else
          puts "Sorry, that position is not valid."
            self.get_pos
        end
    end

    def valid?(input)
        if input.all? { |ele| ele.is_a?(Integer) } 
            return input.all? { |i| i >= 0 && i < @board.board.length }
        end
        return false
    end

    def play_turn
        board = @board.board
        rendered_board = @board.rendered_board
        
        @board.render # Prints board
        pos_1 = self.get_pos # Gets position 1
        system("clear")
        row_1, col_1 = pos_1
        rendered_board[row_1][col_1] = board[row_1][col_1].value # sets value
        
        @board.render # Prints board
        pos_2 = self.get_pos # Gets position 2
        system("clear")
        row_2, col_2 = pos_2
        rendered_board[row_2][col_2] = board[row_2][col_2].value
        
        @board.render
        puts
        puts "Press 'enter' to continue..."
        gets
        system("clear")
        if board[row_1][col_1].value == board[row_2][col_2].value
            return 
        else
            rendered_board[row_1][col_1] = " "
            rendered_board[row_2][col_2] = " "
        end

    end

    def play
        system("clear")
      @board.populate
       until self.win?
        self.play_turn
       end
       puts "Yay, you won!"
    end

    def win?
        @board.rendered_board.flatten.none? {|ele| ele == " "}
    end

end


game = Game.new(6)

game.play