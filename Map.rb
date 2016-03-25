# class Map
class Map
  # attr_accessor :map

  def initialize(map)
    @map = map
  end

  def find(tile)
    @map.each_with_index { |index, i| return [i, index.index(tile)] unless index.index(tile).nil? }
  end
  
  def at(row, column, *args)
    @map[row][column] = args[0] unless args[0].nil?
    @map[row][column]
  end

  def show
    # show map to console
    @map.each do |index|
      index.each { |y| print "#{to_console(y)}  " }
      print "\n"
    end

    if win?
      puts 'WIN!'
    else
      puts "Stones: #{count(STONE)} / Trapped: #{count(TRAPPEDSTONE)} "
    end
  end

  def validate
    # _
  end

  def count(tile)
    i = 0
    @map.each do |row|
      row.each { |x| i += 1 if x == tile }
    end
    i
  end

  def win?
    count(STONE) == 0 ? true : false
  end

  def to_console(val)
    case val
    when WALL then 'X'
    when EMPTY then ' '
    when STONE then'o'
    when TRAP then ':'
    when TRAPPEDSTONE then '0'
    when POSITION then '+'
    else val.to_s
    end
  end
end
