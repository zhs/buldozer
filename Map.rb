# class Map
class Map
  attr_accessor :map

  def initialize(map)
    @map = map
  end

# map - it's an array with map like [[0,0,0],
# 1 - start                          [4,0,1],
# 2 - stone                          [0,0,0]]
# 3 - stone trap
# 4 - wall
# 5 - trapped stone

  def buldozer_position
    # find and return buldozer_position point (1)
    row = 0
    column = 0
    ir = 0
    @map.each do |index|
      unless index.index(1).nil?
        column = index.index(1)
        row = ir
      end
      ir += 1
    end
    [row, column]
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
      puts "Stones: #{count(2)} / Trapped: #{count(5)} "
    end
  end

  def validate?
    error = 0
    @map.size.times do |index|
      error = 1 if @map.size != @map[index].size
    end
    error = 1 if count(2) != count(3)
    check(error)
  end

  def size
    @map.size if validate?
  end

  def count(object)
    i = 0
    @map.each do |row|
      row.each { |x| i += 1 if x == object }
    end
    i
  end

  def win?
    if count(2) == 0
      true
    else
      false
    end	
  end

  def to_console(val)
    case val
    when 4
      'X'
    when 0
      ' '
    when 2
      'o'
    when 3
      ':'
    when 5
      '0'
    when 1
      '+'
    else
      val.to_s
    end
  end

  private

  def check(e)
    case e
    when 1
      false
    when 0
      true
    end
  end
end
