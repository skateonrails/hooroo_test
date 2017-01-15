# frozen_string_literal: true
require 'spec_helper'

describe Robot do
  let(:table) { Table.new(5, 5) }
  let(:robot) { Robot.new(table) }

  context 'before place method' do
    describe '#report' do
      it 'should return nil' do
        expect(robot.report).to be_nil
      end
    end

    describe '#left' do
      it 'should return nil' do
        expect(robot.left).to be_nil
      end
    end

    describe '#right' do
      it 'should return nil' do
        expect(robot.right).to be_nil
      end
    end

    describe '#move' do
      it 'should return nil' do
        expect(robot.move).to be_nil
      end
    end
  end

  context 'after place method' do
    before :each do
      robot.place(0, 0, 'NORTH')
    end

    describe '#report' do
      it 'should return a representation of robot position' do
        expect(robot.report).to eq('0,0,NORTH')
      end
    end

    describe '#left' do
      it 'should return nil' do
        expect(robot.left).to be_nil
      end
    end

    describe '#right' do
      it 'should return nil' do
        expect(robot.right).to be_nil
      end
    end

    describe '#move' do
      it 'should return nil' do
        expect(robot.move).to be_nil
      end
    end
  end
end
