require_relative "Map"
require_relative "buldozer"
require 'io/console'





a = [[4,4,4,4,4,4,4,4,4,4],
     [4,0,0,0,0,0,3,0,0,4],
     [4,4,0,0,2,0,0,0,0,4],
     [4,3,0,0,0,0,0,0,0,4],
     [4,0,0,0,0,0,0,0,0,4],
     [4,0,0,2,0,2,0,1,0,4],
     [4,0,0,0,0,0,0,0,0,4],
     [4,0,0,3,0,4,4,0,0,4],
     [4,0,0,0,0,0,0,0,0,4],
     [4,4,4,4,4,4,4,4,4,4]]

map = Map.new(a)
bul = Buldozer.new(map)






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


system "clear"
#puts "New game" if map.validate?
map.show




def start_game
	
end

c = read_char
until c == "\e"
  

  case c
  when "\e[A"
    bul.up
  when "\e[B"
    bul.down
  when "\e[C"
    bul.right
  when "\e[D"
    bul.left
  
  end
  system "clear"
  map.show
  c = read_char

end







