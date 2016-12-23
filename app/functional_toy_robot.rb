# frozen_string_literal: true
# The FunctionalToyRobot class is the representation of a toy robot
# that was placed on a tabletop
class FunctionalToyRobot < ToyRobot
  FACING_NORTH = 'NORTH'
  FACING_EAST = 'EAST'
  FACING_WEST = 'WEST'
  FACING_SOUTH = 'SOUTH'

  VALID_FACING_VALUES = [FACING_NORTH,
                         FACING_EAST,
                         FACING_WEST,
                         FACING_SOUTH].freeze

  def initialize(x_position, y_position, facing)
    raise 'Invalid position' unless valid_position?(x_position, y_position)
    raise 'Invalid facing value' unless valid_facing_value?(facing)

    @current_x_position = x_position
    @current_y_position = y_position
    @facing = facing
  end

  def report
    "#{@current_x_position},#{@current_y_position},#{@facing}"
  end

  def left
    case @facing
    when FACING_NORTH
      @facing = FACING_EAST
    when FACING_EAST
      @facing = FACING_SOUTH
    when FACING_SOUTH
      @facing = FACING_WEST
    when FACING_WEST
      @facing = FACING_NORTH
    end
  end

  def right
    case @facing
    when FACING_NORTH
      @facing = FACING_WEST
    when FACING_WEST
      @facing = FACING_SOUTH
    when FACING_SOUTH
      @facing = FACING_EAST
    when FACING_EAST
      @facing = FACING_NORTH
    end
  end

  def move
    x_position = @current_x_position
    y_position = @current_y_position

    case @facing
    when FACING_NORTH
      y_position += 1
    when FACING_EAST
      x_position += 1
    when FACING_SOUTH
      y_position += -1
    when FACING_WEST
      x_position += -1
    end

    return false unless valid_position?(x_position, y_position)
    @current_x_position = x_position
    @current_y_position = y_position
    true
  end

  private

  def valid_position?(x_position, y_position)
    (x_position >= 0 && x_position <= 4) && (y_position >= 0 && y_position <= 4)
  end

  def valid_facing_value?(facing)
    VALID_FACING_VALUES.include?(facing)
  end
end
