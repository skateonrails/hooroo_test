# frozen_string_literal: true
# The Robot class is the representation of a toy robot
class Robot
  def initialize(table)
    @table = table
    @engine = nil
  end

  def place(x_position, y_position, direction)
    @engine = begin
      Engine.new(@table, x_position, y_position, direction)
    rescue Engine::InvalidPosition, Engine::InvalidFacingValue
      nil
    end
  end

  def report
    @engine&.report
  end

  def left
    @engine&.left
    nil
  end

  def right
    @engine&.right
    nil
  end

  def move
    @engine&.move
    nil
  end
end
