require_relative "Map"
require_relative "buldozer"
require 'io/console'




class Game
	
	def start_game(map)
		@map = Map.new(map)
		@bul = Buldozer.new(@map)
		system "clear"
		@map.show
		c = read_char

		until c == "\e"
  

  			case c
  			when "\e[A"
    			@bul.up
  			when "\e[B"
    			@bul.down
  			when "\e[C"
    			@bul.right
  			when "\e[D"
    			@bul.left 
  			end
  		system "clear"
  		@map.show
  		c = read_char
		end
	end


	private
	def read_char
  		STDIN.echo = false
  		STDIN.raw!

  		input = STDIN.getc.chr
  		if input == "\e" then
    		input << STDIN.read_nonblock(3) rescue nil
    		input << STDIN.read_nonblock(2) rescue nil
  		end
		ensure
  		STDIN.echo = true
  		STDIN.cooked!

  		return input
	end




end







test_map = [[4,4,4,4,4,4,4,4,4,4],
     [4,0,0,0,0,0,3,0,0,4],
     [4,4,0,0,2,0,0,0,0,4],
     [4,3,0,0,0,0,0,0,0,4],
     [4,0,0,0,0,0,0,0,0,4],
     [4,0,0,2,0,2,0,1,0,4],
     [4,0,0,0,0,0,0,0,0,4],
     [4,0,0,3,0,4,4,0,0,4],
     [4,0,0,0,0,0,0,0,0,4],
     [4,4,4,4,4,4,4,4,4,4]]

game = Game.new
game.start_game(test_map)




#