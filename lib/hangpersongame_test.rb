class HangpersonGame

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service

  # def initialize()
  # end
  
  attr_accessor :word
  attr_accessor :wrong_guesses
  attr_accessor :guesses
  attr_accessor :word_with_guesses
  attr_accessor :check_win_or_lose
  
  
  #@@correct_guess = Array.new
  #@@repeat_array = Array.new
  #@@wrong_guess_list = Array.new
  #@@guess_hash = Hash.new
  #@@game_check_win_or_lose = ""
  
  
  
  
  def initialize(word)
    @word = word
    @wrong_guesses = ''
    @guesses = ''
    @word_with_guesses  = ''
    @guess_array = Array.new
    @check_win_or_lose = ""
    @number_of_guesses = 0
    @number_of_correct_guesses = 0
    @number_of_incorrect_guesses = 0
  end

  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end

  def guess(letter)

    #@guesses = letter
         
    correct_chars = 0
    
    if((letter == nil) || (letter == '') || !(letter =~ /[A-Za-z]/))
     raise ArgumentError.new("Incorrect input")
    end
    
    
    

    if(letter =~ /[a-zA-Z]/ )
        
       if(@prev_correct_guess == letter.downcase || @prev_wrong_guess ==letter.downcase)
           return false
       end
        
        
       if(letter =~ /[#{@word}]/)
           @wrong_guesses = ''
           @guesses = letter
           @prev_correct_guess = letter
           @number_of_correct_guesses = @number_of_correct_guesses + 1
       else
           @wrong_guesses = letter
           @guesses = ''
           @prev_wrong_guess = letter
           @number_of_incorrect_guesses = @number_of_incorrect_guesses + 1
           
           if(@number_of_incorrect_guesses == 7)
              @check_win_or_lose = "lose"
           end
           
       end
           


       length = @word.length
       length = length - 1 

       @guess_array.push(guesses)

       guess_array_length = @guess_array.length

       guess_array_length = guess_array_length -1

 

      for i in 0..length
         @word_with_guesses[i] = '-'
      end
      



      for i in 0..guess_array_length
        for j in 0..length
        
        if(@word[j] == @guess_array[i]    )
           @word_with_guesses[j] = @guess_array[i]
           correct_chars = correct_chars + 1
        end
      end
     end

    

      puts @number_of_incorrect_guesses      
     
      if correct_chars == @word.length
        @check_win_or_lose = "win"
        return @check_win_or_lose
      end
        
      if @number_of_incorrect_guesses > 6
        
        @check_win_or_lose = "lose"
        return @check_win_or_lose
        
      end
        
      
       @check_win_or_lose = "play"
       return @check_win_or_lose
      



           
    return true
      
           #word_with_guesses(@word)
  end #end of if(letter =~ /[a-z]/)
    
    
    
    
    
    
  end  #end of method guess

  


  
  
  
  



end #end of the class

#########################################1




#########################################################################




 
@game = HangpersonGame.new("dog")

@game.guess('o')
@game.guess('g')
@game.guess('d')



puts @game.word_with_guesses
puts @game.check_win_or_lose





