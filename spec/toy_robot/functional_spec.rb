# frozen_string_literal: true
require 'spec_helper'

describe ToyRobot::Functional do
  describe '#initialize' do
    context 'when put inside tabletop limits' do
      let(:toy_robot) { ToyRobot::Functional.new(0, 0, 'NORTH') }

      it 'should set initial position and facing values' do
        expect(toy_robot.current_x_position).to eq(0)
        expect(toy_robot.current_y_position).to eq(0)
        expect(toy_robot.facing).to eq('NORTH')
      end
    end

    context 'when put outside tabletop limits' do
      it 'should raise error' do
        expect{ ToyRobot::Functional.new(5, 0, 'WEST') }.to raise_error(ToyRobot::InvalidPosition)
      end
    end

    context 'using wrong facing value' do
      it 'should raise error' do
        expect{ ToyRobot::Functional.new(0, 0, 'SOUTH WEST') }.to raise_error(ToyRobot::InvalidFacingValue)
      end
    end
  end

  describe '#report' do
    it 'should return the current position and facing direction of toy robot' do
      toy_robot = ToyRobot::Functional.new(0, 0, 'NORTH')
      expect(toy_robot.report).to eq('0,0,NORTH')
    end
  end

  describe '#left' do
    context 'with robot facing NORTH' do
      it 'should set robot to face WEST' do
        toy_robot = ToyRobot::Functional.new(0, 0, 'NORTH')
        toy_robot.left
        expect(toy_robot.facing).to eq('WEST')
      end
    end

    context 'with robot facing EAST' do
      it 'should set robot to face NORTH' do
        toy_robot = ToyRobot::Functional.new(0, 0, 'EAST')
        toy_robot.left
        expect(toy_robot.facing).to eq('NORTH')
      end
    end

    context 'with robot facing SOUTH' do
      it 'should set robot to face EAST' do
        toy_robot = ToyRobot::Functional.new(0, 0, 'SOUTH')
        toy_robot.left
        expect(toy_robot.facing).to eq('EAST')
      end
    end

    context 'with robot facing WEST' do
      it 'should set robot to face SOUTH' do
        toy_robot = ToyRobot::Functional.new(0, 0, 'WEST')
        toy_robot.left
        expect(toy_robot.facing).to eq('SOUTH')
      end
    end
  end

  describe '#right' do
    context 'with robot facing NORTH' do
      it 'should set robot to face EAST' do
        toy_robot = ToyRobot::Functional.new(0, 0, 'NORTH')
        toy_robot.right
        expect(toy_robot.facing).to eq('EAST')
      end
    end

    context 'with robot facing WEST' do
      it 'should set robot to face NORTH' do
        toy_robot = ToyRobot::Functional.new(0, 0, 'WEST')
        toy_robot.right
        expect(toy_robot.facing).to eq('NORTH')
      end
    end

    context 'with robot facing SOUTH' do
      it 'should set robot to face WEST' do
        toy_robot = ToyRobot::Functional.new(0, 0, 'SOUTH')
        toy_robot.right
        expect(toy_robot.facing).to eq('WEST')
      end
    end

    context 'with robot facing EAST' do
      it 'should set robot to face SOUTH' do
        toy_robot = ToyRobot::Functional.new(0, 0, 'EAST')
        toy_robot.right
        expect(toy_robot.facing).to eq('SOUTH')
      end
    end
  end

  describe '#move' do
    describe 'move the toy robot forward the direction it is facing' do
      context 'on valid tabletop positions' do
        context 'with robot facing NORTH' do
          it 'should move robot 1 unit on Y axis' do
            toy_robot = ToyRobot::Functional.new(0, 0, 'NORTH')
            toy_robot.move
            expect(toy_robot.report).to eq('0,1,NORTH')
          end
        end

        context 'with robot facing SOUTH' do
          it 'should move robot -1 unit on Y axis' do
            toy_robot = ToyRobot::Functional.new(0, 1, 'SOUTH')
            toy_robot.move
            expect(toy_robot.report).to eq('0,0,SOUTH')
          end
        end

        context 'with robot facing EAST' do
          it 'should move robot 1 unit on X axis' do
            toy_robot = ToyRobot::Functional.new(0, 0, 'EAST')
            toy_robot.move
            expect(toy_robot.report).to eq('1,0,EAST')
          end
        end

        context 'with robot facing WEST' do
          it 'should move robot 1 unit on X axis' do
            toy_robot = ToyRobot::Functional.new(4, 0, 'WEST')
            toy_robot.move
            expect(toy_robot.report).to eq('3,0,WEST')
          end
        end
      end

      context 'with invalid movement' do
        let(:toy_robot) { ToyRobot::Functional.new(0, 0, 'WEST') }

        it 'should not move toy robot' do
          expect(toy_robot.report).to eq('0,0,WEST')
        end
      end
    end
  end
end
