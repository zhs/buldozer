# class Buldozer
class Buldozer
  def initialize(map)
    @map = map
  end

  def left
    look(-1, 0)
  end

  def right
    look(1,0)	
  end

  def up
    look(0,-1)
  end

  def down
    look(0,1)
  end

  private

  def look(leftright, updown)
    current_row = @map.buldozer_position[0]
    current_column = @map.buldozer_position[1]

    case @map.map[current_row+updown][current_column+leftright]
    # wall.
    when 4,5
      nil
    # empty or trap
    when 0
      @map.map[current_row][current_column] = 0
      @map.map[current_row + updown][current_column + leftright] = 1	
    # stone
    when 2
      case @map.map[current_row + updown * 2][current_column + leftright * 2]
      when 4,2,5
        nil
      when 0
        move_stone(leftright, updown, current_row, current_column)
      # stone trap
      when 3
        move_stone(leftright, updown, current_row, current_column)
        # trapped!
        @map.map[current_row + updown * 2][current_column + leftright * 2] = 5
      end
    end
		
  end

  def move_stone(leftright, updown, current_row, current_column)
    @map.map[current_row][current_column] = 0
    @map.map[current_row + updown][current_column + leftright] = 1
    @map.map[current_row + updown * 2][current_column + leftright * 2] = 2
  end
end
