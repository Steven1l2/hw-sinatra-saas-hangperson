class HangpersonGame

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service

  # def initialize()
  # end
  
  attr_accessor :word
  attr_accessor :wrong_guesses
  attr_accessor :guesses
  
  @@correct_guess = Array.new
  @@repeat_array = Array.new
  @@wrong_guess_list = Array.new
  @@guess_hash = Hash.new

  
  
  
  def initialize(word)
    @word = word
    @wrong_guesses = ''
    @guesses = ''
  end

  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end

  def guess(letter)

    @guesses = letter
    @guesses_temp = letter
   
    
    if((@guesses == nil) || (@guesses == '') || !(@guesses =~ /[A-Za-z]/))
     raise ArgumentError.new("Incorrect input")
    end

    
    
    
    
    
    
  end



end
