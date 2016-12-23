# frozen_string_literal: true
# Table represents the table that robot will move
class Table
  def initialize(x_units, y_units)
    @x_units = 0...x_units
    @y_units = 0...y_units
  end

  def valid_square?(x_position, y_position)
    @x_units.include?(x_position) && @y_units.include?(y_position)
  end
end
