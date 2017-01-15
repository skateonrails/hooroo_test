# frozen_string_literal: true
# InputParser is responsible to parse input, use it with Command class
# and outputs result if necessary
class SetupToyRobot
  attr_reader :input

  def initialize(input)
    @input = input
    table = Table.new(5, 5)
    robot = Robot.new(table)
    @command = Command.new(robot)
  end

  def run
    @input.each_line do |line|
      output = @command.run(line.chomp)
      puts output if output
    end
  end
end
