# frozen_string_literal: true
require 'spec_helper'

describe Table do
  let(:table) { Table.new(5, 5) }

  describe '#valid_square?' do
    it 'should return true if inside table limits' do
      expect(table.valid_square?(3, 3)).to be true
    end

    it 'should return false if outside table limits' do
      expect(table.valid_square?(5, 3)).to be false
    end
  end
end
