class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  
  def self.random_word 
     DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    arr = []
    @secret_word.each_char.with_index { |c,i| arr << i if char == c }
    arr
  end


  def fill_indices(char, array)
    array.each { |idx| guess_word[idx] = char}
  end
 ################################################################
  def try_guess(char)
    if self.get_matching_indices(char).length == 0
      @remaining_incorrect_guesses -= 1
    else 
      arr = self.get_matching_indices(char) 
      self.fill_indices(char, arr) # [1] @guess_word[1] char [_ ,_ ,_ ] -> [_, o, _]
    end

    if self.already_attempted?(char)
      p 'that has already been attempted'
      false
    else
      @attempted_chars << char
      true
    end
  end

  def ask_user_for_guess
    p 'Enter a char:'

    response = gets.chomp

    self.try_guess(response)
    
  end

  def win? 
    if @guess_word.join == @secret_word
      p "WIN"
      return true
    else 
      return false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      p "LOSE"
      return true
    else 
      return false
    end
  end


  def game_over?
    if self.win? || self.lose?
      p @secret_word
      true
    else
      false
    end
  end

  
end
