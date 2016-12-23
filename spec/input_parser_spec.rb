# frozen_string_literal: true
require 'spec_helper'

describe InputParser do
  describe '#run' do
    context 'using files from example_inputs folder' do
      context 'using input1.md' do
        let(:input) { File.new(File.join(File.dirname(__FILE__), %w(example_inputs input1.md))) }

        it 'should return 0,1,NORTH as output' do
          expect{ InputParser.new(input).run }.to output("0,1,NORTH\n").to_stdout
        end
      end

      context 'using input2.md' do
        let(:input) { File.new(File.join(File.dirname(__FILE__), %w(example_inputs input2.md))) }

        it 'should return 0,0,WEST as output' do
          expect{ InputParser.new(input).run }.to output("0,0,WEST\n").to_stdout
        end
      end

      context 'using input3.md' do
        let(:input) { File.new(File.join(File.dirname(__FILE__), %w(example_inputs input3.md))) }

        it 'should return 3,3,NORTH as output' do
          expect{ InputParser.new(input).run }.to output("3,3,NORTH\n").to_stdout
        end
      end

      context 'using input4.md' do
        let(:input) { File.new(File.join(File.dirname(__FILE__), %w(example_inputs input4.md))) }

        it 'should return 4,2,EAST as output' do
          expect{ InputParser.new(input).run }.to output("4,2,EAST\n").to_stdout
        end
      end

      context 'using input5.md' do
        let(:input) { File.new(File.join(File.dirname(__FILE__), %w(example_inputs input5.md))) }

        it 'should return 3,1,WEST as output' do
          expect{ InputParser.new(input).run }.to output("3,1,WEST\n").to_stdout
        end
      end
    end
  end
end
