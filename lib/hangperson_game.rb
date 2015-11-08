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
  
  @@correct_guess = Array.new
  @@repeat_array = Array.new
  @@wrong_guess_list = Array.new
  @@guess_hash = Hash.new
  @@game_check_win_or_lose = ""
  @@guess_array = Array.new
  
  
  
  def initialize(word)
    @word = word
    @wrong_guesses = ''
    @guesses = ''
    @word_with_guesses = ''
  end

  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end

  def guess(letter)

    
    
    
    if((letter == nil) || (letter == '') || !(letter =~ /[A-Za-z]/))
     raise ArgumentError.new("Incorrect input")
    end


   
   if(letter =~ /[a-zA-Z]/ )
        
       if(@prev_correct_guess == letter.downcase || @prev_wrong_guess ==letter.downcase)
           return false
       end
        
        
       if(letter =~ /[#{@word}]/)
           @guesses = letter
           @prev_correct_guess = letter
       else
           @wrong_guesses = letter
           @prev_wrong_guess = letter
       end
           
           
       length = @word.length
       length = length - 1 

       @@guess_array.push(guesses)

       guess_array_length = @@guess_array.length

       guess_array_length = guess_array_length -1

 

      for i in 0..length
         @word_with_guesses[i] = '-'
      end

      for i in 0..guess_array_length
        for j in 0..length
        
        if(@word[j] == @@guess_array[i]    )
           @word_with_guesses[j] = @@guess_array[i]
        end
      end
     end
           
           
           
           
           
           
           
           
           
           
       return true
      
           
 end #end of if(letter =~ /[a-z]/)

##################################################


     


##################################################
     
    
    
    
end #end of method guess

  



       
       



end #end of the class
