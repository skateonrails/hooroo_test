# frozen_string_literal: true
require 'spec_helper'

describe Command do
  let(:command) { Command.new }

  describe '#initialize' do
    it 'should setup toy_robot' do
      expect(command.toy_robot).to be_a(ToyRobot::Base)
    end
  end

  describe '#run' do
    context 'using invalid command' do
      it 'should return nil' do
        expect(command.run('ANY_INVALID_COMMAND')).to be_nil
      end
    end

    describe 'get input and transform into a command for ToyRobot' do
      context 'PLACE' do
        it 'should set a FunctionalToyRobot' do
          expect(ToyRobot::Functional).to receive(:new).with(0, 1, 'NORTH')
          command.run('PLACE 0,1,NORTH')
        end
      end

      context 'MOVE' do
        it 'should call toy_robot#move' do
          expect(command.toy_robot).to receive(:move)
          command.run('MOVE')
        end
      end

      context 'LEFT' do
        it 'should call toy_robot#left' do
          expect(command.toy_robot).to receive(:left)
          command.run('LEFT')
        end
      end

      context 'RIGHT' do
        it 'should call toy_robot#right' do
          expect(command.toy_robot).to receive(:right)
          command.run('RIGHT')
        end
      end

      context 'REPORT' do
        it 'should call toy_robot#report' do
          expect(command.toy_robot).to receive(:report).and_call_original
          command.run('REPORT')
        end
      end
    end
  end
end
