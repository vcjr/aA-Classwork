class Player
    attr_reader :name

    def initialize(name)
        @name = name
        @guess = nil 
    end

    def guess(char)
        @guess = char
    end

    def alert_invalid_guess
        puts "#{guess} is not a valid input #{@name}!"
    end
end

# cathy.guess("a") 
# cathy.alert_invalid_guess   
# Player
# I wrote initialize, guess, and alert_invalid_guess methods. You'll probably 
# want each Player to have a name, as well.