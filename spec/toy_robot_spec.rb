# frozen_string_literal: true
require 'spec_helper'

describe ToyRobot do
  let(:toy_robot) { ToyRobot.new }

  describe '#report' do
    it 'should return nil' do
      expect(toy_robot.report).to be_nil
    end
  end

  describe '#left' do
    it 'should return nil' do
      expect(toy_robot.left).to be_nil
    end
  end

  describe '#right' do
    it 'should return nil' do
      expect(toy_robot.right).to be_nil
    end
  end

  describe '#move' do
    it 'should return nil' do
      expect(toy_robot.move).to be_nil
    end
  end
end
