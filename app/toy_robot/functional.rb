# frozen_string_literal: true
module ToyRobot
  # The ToyRobot::Functional class is the representation of a toy robot
  # that was placed on a tabletop
  class Functional < ToyRobot::Base
    FACING_NORTH = 'NORTH'
    FACING_EAST = 'EAST'
    FACING_WEST = 'WEST'
    FACING_SOUTH = 'SOUTH'

    VALID_FACING_VALUES = [FACING_NORTH,
                           FACING_EAST,
                           FACING_WEST,
                           FACING_SOUTH].freeze

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
      case @facing
      when FACING_NORTH
        @facing = FACING_WEST
      when FACING_EAST
        @facing = FACING_NORTH
      when FACING_SOUTH
        @facing = FACING_EAST
      when FACING_WEST
        @facing = FACING_SOUTH
      end

      nil
    end

    def right
      case @facing
      when FACING_NORTH
        @facing = FACING_EAST
      when FACING_WEST
        @facing = FACING_NORTH
      when FACING_SOUTH
        @facing = FACING_WEST
      when FACING_EAST
        @facing = FACING_SOUTH
      end

      nil
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
      VALID_FACING_VALUES.include?(facing)
    end
  end
end
