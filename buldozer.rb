# class Buldozer
class Buldozer
  def initialize(map)
    @map = map
    @@trap_status = false
  end

  def left
    look(-1, 0)
  end

  def right
    look(1, 0)
  end

  def up
    look(0, -1)
  end

  def down
    look(0, 1)
  end

  private

  def look(leftright, updown)
    current_row, current_column = @map.buldozer_position

    case @map.at(current_row + updown, current_column + leftright)
    # empty or trap
    when EMPTY
      @map.at(current_row, current_column, EMPTY)
      if @@trap_status 
        @map.at(current_row, current_column, TRAP)
        @@trap_status = false
      end
      @map.at(current_row + updown, current_column + leftright, POSITION)
    # stone
    when STONE
      look_stone(leftright, updown, current_row, current_column)
    when TRAP
      @map.at(current_row, current_column, EMPTY)
      @map.at(current_row + updown, current_column + leftright, POSITION)
      @@trap_status = true
    when TRAPPEDSTONE
      @map.at(current_row, current_column, EMPTY)
      @map.at(current_row + updown, current_column + leftright, POSITION)
      @map.at(current_row + updown * 2, current_column + leftright * 2, STONE)
      
      @@trap_status = true
    end
  end

  def move_stone(leftright, updown, current_row, current_column)
    @map.at(current_row, current_column, EMPTY)
    @map.at(current_row + updown, current_column + leftright, POSITION)
    @map.at(current_row + updown * 2, current_column + leftright * 2, STONE)
  end

  def look_stone(leftright, updown, current_row, current_column)
    case @map.at(current_row + updown * 2, current_column + leftright * 2)
    when EMPTY
      move_stone(leftright, updown, current_row, current_column)
      if @@trap_status 
        @map.at(current_row, current_column, TRAP)
        @@trap_status = false
      end
    # stone trap
    when TRAP
      move_stone(leftright, updown, current_row, current_column)
      @map.at(current_row + updown * 2, current_column + leftright * 2, TRAPPEDSTONE)
      if @@trap_status 
        @map.at(current_row, current_column, TRAP)
        @@trap_status = false
      end
    end
  end
end
