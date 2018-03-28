require 'spec_helper'

describe TicTacToe::Game do
  let(:bob) { TicTacToe::Player.new({color: "X", name: "bob"}) }
  let(:arief) { TicTacToe::Player.new({color: "O", name: "arief"}) }
  
  context "#initialize" do
    it "randomly pick a current player" do
      allow_any_instance_of(Array).to receive(:shuffle) { [arief, bob] }
      game = TicTacToe::Game.new([bob, arief])
      expect(game.current_player).to eq arief
    end

    it "randomly picked a other player" do
      allow_any_instance_of(Array).to receive(:shuffle) { [arief, bob] }
      game = TicTacToe::Game.new([arief, bob])
      expect(game.other_player).to eq bob  
    end
  end

  context "#switch_players" do
    it "will set @current_player to @other_player" do
      game = TicTacToe::Game.new([bob, arief])
      other_player = game.other_player
      game.switch_players
      expect(game.current_player).to eq other_player
    end

    it "will set @other_player to @current_player" do
      game = TicTacToe::Game.new([bob, arief])
      current_player = game.current_player
      game.switch_players
      expect(game.other_player).to eq current_player  
    end
  end

  context "#ask_player" do
    it "asks player to make their move" do
      game = TicTacToe::Game.new([bob, arief])
      allow(game).to receive(:current_player) { bob }
      expected = "bob: Enter number between 1 and 9 to make move"
      expect(game.ask_turn).to eq(expected)  
    end
  end

  context "#get_move" do
    it "get move by entering number between 1 to 9" do 
      game = TicTacToe::Game.new([bob, arief])
      expect(game.get_move("1")).to eq [0,0]   
    end

    it "get move by entering number between 1 to 9" do
      game = TicTacToe::Game.new([bob, arief])
      expect(game.get_move("7")).to eq [0,2]  
    end
  end

  context "#game_over_message" do
    it "returns '{current_player.name}' won! if give result winner" do
      game = TicTacToe::Game.new([bob, arief])
      allow(game).to receive(:current_player) { arief }
      allow(game.board).to receive(:game_over) { :winner }
      expect(game.game_over_message).to eq "arief won!"  
    end

    it "returns the game draw, if give result draw" do
      game = TicTacToe::Game.new([bob, arief])
      allow(game).to receive(:current_player) { arief }
      allow(game.board).to receive(:game_over) { :draw }
      expected = "the game ended with no winners"
      expect(game.game_over_message).to eq expected
    end
  end
end
