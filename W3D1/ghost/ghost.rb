
# The solution is the trick if __FILE__ == $PROGRAM_NAME. This checks to see
# if the currently running program ($PROGRAM_NAME) is the same as the current 
# file (primes.rb). If so, then this is being invoked as a script, so we should
# kick things off. Otherwise, we're loading it as part of some other program 
# (like irb or Pry), and we shouldn't do more than load the method definitions 
# so that someone else may use them.


# Learning Goals
# Understand how different classes interact
# Be able to write classes in different files and use require_relative to connect them
# Know how to test methods in pry
# Know how to read lines from a text file
# Understand how __FILE__ == $PROGRAM_NAME works
# Phase 1: Playing a Single Round
# Let's start by writing the logic to play a single round of Ghost (that is, playing until one 
# player spells a word). Write your game for two players only, and don't worry about keeping track 
# of wins/losses (we can get to this later). The basic logic will look something like this:

# Instantiate a new Game object, passing in both of the Players.
# The Game maintains a fragment instance variable, which represents the word as it has been built up by the players.
# The Players take turns adding a letter to the fragment. The Game should ensure that a play is valid before actually changing the fragment.
# The Game checks the fragment against a dictionary; if the fragment is a word contained in the dictionary, then the previous player loses.

# https://www.rubyguides.com/2015/05/working-with-files-ruby/
# dictionary = ["apples", "candy", "people"]
# command + A
# command + c copies
# command + v paste

# 16gigabit
# 0 1 bit
# 8 byte
# megabyte
# giga

# Set[1, 2, 3] === 2   #=> true
# Set[1, 2, 3] === 4   #=> false
# dictionary = ["cat", "dog", "bird"].to_set
# p dictionary (returns the set) => #<Set: {"cat", "dog", "bird"}>
# dictionary === "cat" => true
__FILE__ == $PROGRAM_NAME

require "set"
require_relative "player"

class Ghost
    def initialize(dictionary, *players)
        @dictionary = dictionary
        @players = players # ["Cathy", "Victor"] [0] [1] = [1] [0] ["Victor", "Cathy"]
        @fragment = "" #Set.new here
        @win = false
        @lose = false
    end
    
    #play_round
    # The core game logic lives here. I wrote a number of helper methods to keep things clean:
    def play_round
        # s1 = Set[1, 2]                        #=> #<Set: {1, 2}>
        # s2 = [1, 2].to_set                    #=> #<Set: {1, 2}>
        # s1 == s2                              #=> true
        # s1.add("foo")                         #=> #<Set: {1, 2, "foo"}>
        # s1.merge([2, 6])                      #=> #<Set: {1, 2, "foo", 6}>
        # s1.subset?(s2)                        #=> false
        # s2.subset?(s1)                        #=> true
       self.take_turn(self.current_player)
       
       if @fragment.length >= 3 && @fragment.to_set.subset?(@dictionary) 
            self.win_lose?
            self.game_over?
       end
       self.next_player!
    end

    def current_player
        @players[0] # Player Class @players = "Cathy"
    end

    def previous_player
        @players[1]
    end
    #
    def next_player!
        # Will switch current player to previous player
        @players[0], @players[1] = @players[1], @players[0]
    end
    #
    def take_turn(player) 
        puts "#{player.name} is your turn. One Char please!!"
        input = gets.chomp.downcase
        if self.valid_play?(input)
            # char = player.guess(input)
            @fragment = @fragment.to_set
            @fragment.add(player.guess(input)) 
        else
            player.alert_invalid_guess
            # self.take_turn(player)
        end

        p @fragment
    end
    #
    def valid_play?(str) # take turn 
        if str != str.to_s || str.length != 1
            return false
        else
            true
        end
    end

    def win_lose?
        if @dictionary === @fragment 
            puts "You Lose!! hahaha"
            @lost = true
            
        else
            puts "You win!"
            @win = true
        end
    end
    

    def game_over?
        if @win || @lose
            return true
        else
            false
        end

    end

    def run
        puts "Welcome to the game Ghost."
        self.play_round until self.game_over?
    end

end


file = File.open("dictionary.txt")
dictionary = (file.readlines.map(&:chomp)).to_set
file.close # Closes file so that it's no loner in memory. RAM()

# cathy = Player.new("Cathy")
# victor = Player.new("Victor")
# game = Ghost.new(dictionary, cathy, victor)



if __FILE__ == $PROGRAM_NAME
    game = Ghost.new(
        dictionary,
        Player.new("Janira"),
        Player.new("Victor")
    )

    game.run
end
# The Game maintains a fragment instance variable, which represents the word as it has been built up by the players.
# The Players take turns adding a letter to the fragment. The Game should ensure that a play is valid before actually changing the fragment.
# The Game checks the fragment against a dictionary; if the fragment is a word contained in the dictionary, then the previous player loses.

####