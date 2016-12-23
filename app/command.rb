# frozen_string_literal: true
# The Command class is responsible to parse a command string
# and translate commands to toy robot
class Command
  MOVE_COMMAND = 'MOVE'
  LEFT_COMMAND = 'LEFT'
  RIGHT_COMMAND = 'RIGHT'
  REPORT_COMMAND = 'REPORT'
  PLACE_COMMAND_REPRESENTATION = 'PLACE\s(\d)\,(\d)\,([A-Z]+)'
  PLACE_COMMAND_REGEXP = /#{PLACE_COMMAND_REPRESENTATION}/
  VALID_COMMANDS_REGEXP = /(#{MOVE_COMMAND}|#{LEFT_COMMAND}|#{RIGHT_COMMAND}|#{REPORT_COMMAND}|(#{PLACE_COMMAND_REPRESENTATION}))/

  attr_reader :toy_robot

  def initialize(table)
    @table = table
    @toy_robot = ToyRobot::Base.new
    @command_string = nil
    clear_place_command_params
  end

  def run(command_string)
    clear_place_command_params
    @command_string = command_string
    return nil unless valid_command?
    return place_robot if valid_place_command?

    @toy_robot.send(@command_string.to_s.downcase.to_sym)
  end

  private

  def clear_place_command_params
    @place_command_params = nil
  end

  def place_command_parse
    @place_command_params ||= @command_string.match(PLACE_COMMAND_REGEXP)
  end

  def place_robot
    @toy_robot = ToyRobot::Functional.new(*parsed_place_params)
    nil
  end

  def valid_command?
    @command_string =~ VALID_COMMANDS_REGEXP
  end

  def valid_place_command?
    !!place_command_parse
  end

  def parsed_place_params
    [@table, place_command_parse[1].to_i, place_command_parse[2].to_i, place_command_parse[3].to_s]
  end
end
