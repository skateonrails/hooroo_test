# frozen_string_literal: true
require 'spec_helper'

describe Engine do
  let(:table) { Table.new(5, 5) }

  describe '#initialize' do
    context 'when put inside table limits' do
      let(:engine) { Engine.new(table, 0, 0, 'NORTH') }

      it 'should set initial position and facing values' do
        expect(engine.current_x_position).to eq(0)
        expect(engine.current_y_position).to eq(0)
        expect(engine.facing).to eq('NORTH')
      end
    end

    context 'when put outside tabletop limits' do
      it 'should raise error' do
        expect{ Engine.new(table, 5, 0, 'WEST') }.to raise_error(Engine::InvalidPosition)
      end
    end

    context 'using wrong facing value' do
      it 'should raise error' do
        expect{ Engine.new(table, 0, 0, 'SOUTH WEST') }.to raise_error(Engine::InvalidFacingValue)
      end
    end
  end

  describe '#report' do
    it 'should return the current position and facing direction of toy robot' do
      engine = Engine.new(table, 0, 0, 'NORTH')
      expect(engine.report).to eq('0,0,NORTH')
    end
  end

  describe '#left' do
    context 'with robot facing NORTH' do
      it 'should set robot to face WEST' do
        engine = Engine.new(table, 0, 0, 'NORTH')
        engine.left
        expect(engine.facing).to eq('WEST')
      end
    end

    context 'with robot facing EAST' do
      it 'should set robot to face NORTH' do
        engine = Engine.new(table, 0, 0, 'EAST')
        engine.left
        expect(engine.facing).to eq('NORTH')
      end
    end

    context 'with robot facing SOUTH' do
      it 'should set robot to face EAST' do
        engine = Engine.new(table, 0, 0, 'SOUTH')
        engine.left
        expect(engine.facing).to eq('EAST')
      end
    end

    context 'with robot facing WEST' do
      it 'should set robot to face SOUTH' do
        engine = Engine.new(table, 0, 0, 'WEST')
        engine.left
        expect(engine.facing).to eq('SOUTH')
      end
    end
  end

  describe '#right' do
    context 'with robot facing NORTH' do
      it 'should set robot to face EAST' do
        engine = Engine.new(table, 0, 0, 'NORTH')
        engine.right
        expect(engine.facing).to eq('EAST')
      end
    end

    context 'with robot facing WEST' do
      it 'should set robot to face NORTH' do
        engine = Engine.new(table, 0, 0, 'WEST')
        engine.right
        expect(engine.facing).to eq('NORTH')
      end
    end

    context 'with robot facing SOUTH' do
      it 'should set robot to face WEST' do
        engine = Engine.new(table, 0, 0, 'SOUTH')
        engine.right
        expect(engine.facing).to eq('WEST')
      end
    end

    context 'with robot facing EAST' do
      it 'should set robot to face SOUTH' do
        engine = Engine.new(table, 0, 0, 'EAST')
        engine.right
        expect(engine.facing).to eq('SOUTH')
      end
    end
  end

  describe '#move' do
    describe 'move the toy robot forward the direction it is facing' do
      context 'on valid tabletop positions' do
        context 'with robot facing NORTH' do
          it 'should move robot 1 unit on Y axis' do
            engine = Engine.new(table, 0, 0, 'NORTH')
            engine.move
            expect(engine.report).to eq('0,1,NORTH')
          end
        end

        context 'with robot facing SOUTH' do
          it 'should move robot -1 unit on Y axis' do
            engine = Engine.new(table, 0, 1, 'SOUTH')
            engine.move
            expect(engine.report).to eq('0,0,SOUTH')
          end
        end

        context 'with robot facing EAST' do
          it 'should move robot 1 unit on X axis' do
            engine = Engine.new(table, 0, 0, 'EAST')
            engine.move
            expect(engine.report).to eq('1,0,EAST')
          end
        end

        context 'with robot facing WEST' do
          it 'should move robot 1 unit on X axis' do
            engine = Engine.new(table, 4, 0, 'WEST')
            engine.move
            expect(engine.report).to eq('3,0,WEST')
          end
        end
      end

      context 'with invalid movement' do
        let(:engine) { Engine.new(table, 0, 0, 'WEST') }

        it 'should not move toy robot' do
          expect(engine.report).to eq('0,0,WEST')
        end
      end
    end
  end
end
