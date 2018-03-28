require 'spec_helper'

describe TicTacToe::Cell do
  context "#initialize" do
    it "is initialize with a value of '' by default" do
      cell = TicTacToe::Cell.new
      expect(cell.value).to eq ""
    end

    it "is initialize with a value of 'X'" do
      cell = TicTacToe::Cell.new("X")
      expect(cell.value).to eq "X"
    end
  end
end