# frozen_string_literal: true
# The ToyRobot class is the representation of a toy robot
# with it's events, like report, left, right and move.
class ToyRobot
  attr_reader :current_x_position,
              :current_y_position,
              :facing

  def initialize
    @current_x_position = nil
    @current_y_position = nil
    @facing = nil
  end

  def report
    nil
  end

  def left
    nil
  end

  def right
    nil
  end

  def move
    nil
  end
end
