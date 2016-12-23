# frozen_string_literal: true
module ToyRobot
  # The ToyRobot::Functional class is the representation of a toy robot
  # that was placed on a tabletop
  class Functional < ToyRobot::Base
    FACING_NORTH = 'NORTH'
    FACING_EAST = 'EAST'
    FACING_WEST = 'WEST'
    FACING_SOUTH = 'SOUTH'

    FACING_DIRECTIONS_DICT = { FACING_NORTH => {left: FACING_WEST,
                                                right: FACING_EAST,
                                                y_position: 1,
                                                x_position: 0},
                               FACING_SOUTH => {left: FACING_EAST,
                                                right: FACING_WEST,
                                                y_position: -1,
                                                x_position: 0},
                               FACING_EAST => {left: FACING_NORTH,
                                               right: FACING_SOUTH,
                                               y_position: 0,
                                               x_position: 1},
                               FACING_WEST => {left: FACING_SOUTH,
                                               right: FACING_NORTH,
                                               y_position: 0,
                                               x_position: -1} }.freeze

    def initialize(x_position, y_position, facing)
      raise InvalidPosition unless valid_position?(x_position, y_position)
      raise InvalidFacingValue unless valid_facing_value?(facing)

      @current_x_position = x_position
      @current_y_position = y_position
      @facing = facing
    end

    def report
      "#{@current_x_position},#{@current_y_position},#{@facing}"
    end

    def left
      rotate(:left)
      nil
    end

    def right
      rotate(:right)
      nil
    end

    def move
      x_position = @current_x_position + direction_instructions[:x_position]
      y_position = @current_y_position + direction_instructions[:y_position]

      if valid_position?(x_position, y_position)
        @current_x_position = x_position
        @current_y_position = y_position
      end

      nil
    end

    private

    def valid_position?(x_position, y_position)
      (x_position >= 0 && x_position <= 4) && (y_position >= 0 && y_position <= 4)
    end

    def valid_facing_value?(facing)
      FACING_DIRECTIONS_DICT.keys.include?(facing)
    end

    def rotate(direction)
      @facing = direction_instructions[direction]
    end

    def direction_instructions
      FACING_DIRECTIONS_DICT[@facing]
    end
  end
end
