# frozen_string_literal: true
# InputParser is responsible to parse input, use it with command
# and outputs result if necessary
class InputParser
  attr_reader :input

  def initialize(input)
    @input = input
    @command = Command.new
  end

  def run
    @input.each_line do |line|
      output = @command.run(line.chomp)
      puts output if output
    end
  end
end
