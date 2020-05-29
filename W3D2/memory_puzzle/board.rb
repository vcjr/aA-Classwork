require_relative "Deck"
require_relative "Card"

class Board

    # System("clear")
    attr_reader :board, :deck, :rendered_board

    def initialize(size) # 10 -> 100
        if size.even? && size <= 6
            @board = Array.new(size) { Array.new(size, nil)}
        else
            raise "please Enter Only Even Numbers"
        end

        @deck = Deck.new((size * size) / 2).shuffle 
        @rendered_board = Array.new(size) { Array.new(size, " ")}
    end

    def populate
        i = 0
        @board.each_with_index do |row, x|
            @board.each_with_index do |col, y|
                @board[x][y] = @deck[i]
                i += 1
            end
        end
    end
    
    def render
        sc = (0...@board.length).to_a.join(" ")
        puts "  " + sc
        @rendered_board.each_with_index { |row, i| puts "#{i} #{row.join(" ")} "}
        return
    end

    def reveal(guess_pos)
        x, y = guess_pos
        @rendered_board[x][y] = @board[x][y].show
        return @board[x][y]
    end
end

# @board .... @board[row_1][col_1] == @board[row_2][col_2]
#  --> @rendered_board[row_1][col_1] = @board[row_1][col_1].value
#  --> @rendered_board[row_2][col_2] = @board[row_2][col_2].value

if __FILE__ == $PROGRAM_NAME
  a = Board.new
  a.populate
  puts a.render
  puts "Gimmie some coords"
  a.reveal(gets.chomp.split(" ").map(&:to_i))
end
