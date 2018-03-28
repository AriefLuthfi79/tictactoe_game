require 'spec_helper'

describe TicTacToe::Player do
  context "under #initialize" do
    # it "raises an expection when initialized with {} null value" do
    #   expect{ TicTacToe::Player.new({}) }.to raise_error
    # end

    it "does not raise an error when initialized with a value" do
      input = { color: "X", name: "Someone" }
      expect { TicTacToe::Player.new(input) }.to_not raise_error
    end
  end

  context "#color" do
    it "returns the color" do
      input = { color: "X", name: "Someone" }
      player = TicTacToe::Player.new(input)
      expect(player.color).to eq "X"  
    end
  end

  context "#name" do
    it "returns the name" do
      input = { color: "O", name: "Arief" }
      player = TicTacToe::Player.new(input)
      expect(player.name).to eq "Arief"
    end
  end
end
