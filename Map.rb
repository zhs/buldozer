# class Map
class Map
  attr_accessor :map

  def initialize(map)
    @map = map
  end

  def buldozer_position
    # find and return buldozer_position point (1)
    row = 0
    column = 0
    ir = 0
    @map.each do |index|
      unless index.index(POSITION).nil?
        column = index.index(POSITION)
        row = ir
      end
      ir += 1
    end
    [row, column]
  end

  def at(row, column, *args)
    
    @map[row][column] = args[0] if not args[0].nil?
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

  def size
    @map.size
  end

  def count(object)
    i = 0
    @map.each do |row|
      row.each { |x| i += 1 if x == object }
    end
    i
  end

  def win?
    if count(STONE) == 0
      true
    else
      false
    end
  end

  def to_console(val)
    case val
    when WALL
      'X'
    when EMPTY
      ' '
    when STONE
      'o'
    when TRAP
      ':'
    when TRAPPEDSTONE
      '0'
    when POSITION
      '+'
    else
      val.to_s
    end
  end
end
