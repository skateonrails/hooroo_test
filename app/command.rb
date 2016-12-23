# frozen_string_literal: true
# The Command class is responsible to parse a command string
# and call methods on a toy_robot
class Command
  MOVE_COMMAND = 'MOVE'
  LEFT_COMMAND = 'LEFT'
  RIGHT_COMMAND = 'RIGHT'
  REPORT_COMMAND = 'REPORT'
  PLACE_COMMAND = 'PLACE\s(\d)\,(\d)\,([A-Z]+)'
  PLACE_COMMAND_REGEXP = /#{PLACE_COMMAND}/
  VALID_COMMANDS_REGEXP = /(#{MOVE_COMMAND}|#{LEFT_COMMAND}|#{RIGHT_COMMAND}|#{REPORT_COMMAND}|(#{PLACE_COMMAND}))/

  attr_reader :toy_robot

  def initialize
    @toy_robot = ToyRobot::Base.new
  end

  def run(command_string)
    return nil unless command_string =~ VALID_COMMANDS_REGEXP

    return place_robot(command_string) if command_string =~ PLACE_COMMAND_REGEXP
    @toy_robot.send(command_string.to_s.downcase.to_sym)
  end

  private

  def place_robot(command_string)
    @toy_robot = ToyRobot::Functional.new(*place_params(command_string))
    nil
  end

  def place_params(command_string)
    valid_params = command_string.match(PLACE_COMMAND_REGEXP)
    [valid_params[1].to_i, valid_params[2].to_i, valid_params[3]]
  end
end
