# frozen_string_literal: true
# The Engine class is responsible to move the robot
class Engine
  class InvalidPosition < StandardError; end
  class InvalidFacingValue < StandardError; end

  FACING_NORTH = 'NORTH'
  FACING_EAST = 'EAST'
  FACING_WEST = 'WEST'
  FACING_SOUTH = 'SOUTH'

  FACING_DIRECTIONS_DICT = { FACING_NORTH => { left: FACING_WEST,
                                               right: FACING_EAST,
                                               y_position: 1,
                                               x_position: 0 },
                             FACING_SOUTH => { left: FACING_EAST,
                                               right: FACING_WEST,
                                               y_position: -1,
                                               x_position: 0 },
                             FACING_EAST => { left: FACING_NORTH,
                                              right: FACING_SOUTH,
                                              y_position: 0,
                                              x_position: 1 },
                             FACING_WEST => { left: FACING_SOUTH,
                                              right: FACING_NORTH,
                                              y_position: 0,
                                              x_position: -1 } }.freeze

  attr_reader :current_x_position, :current_y_position, :facing

  def initialize(table, x_position, y_position, facing)
    @table = table
    @facing = facing
    raise InvalidPosition unless @table.valid_square?(x_position, y_position)
    raise InvalidFacingValue unless valid_facing_value?

    @current_x_position = x_position
    @current_y_position = y_position
  end

  def report
    "#{@current_x_position},#{@current_y_position},#{@facing}"
  end

  def left
    rotate(:left)
  end

  def right
    rotate(:right)
  end

  def move
    x_position = @current_x_position + direction_instructions[:x_position]
    y_position = @current_y_position + direction_instructions[:y_position]
    return unless @table.valid_square?(x_position, y_position)

    @current_x_position = x_position
    @current_y_position = y_position
  end

  private

  def valid_facing_value?
    FACING_DIRECTIONS_DICT.keys.include?(@facing)
  end

  def direction_instructions
    FACING_DIRECTIONS_DICT[@facing]
  end

  def rotate(direction)
    @facing = direction_instructions[direction]
  end
end
