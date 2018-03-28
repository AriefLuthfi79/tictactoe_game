require "tictactoe/version"
require 'tictactoe/cell'
require 'tictactoe/player'
require 'tictactoe/board'
require 'tictactoe/core_extension'
require 'tictactoe/game'

class Playing
  class << self
    def run
      puts "Welcome to tictactoe game"
      player1 = TicTacToe::Player.new({color: "X", name: "Arief"})
      player2 = TicTacToe::Player.new({color: "O", name: "Luthfi"})
      players = [player1, player2]
      TicTacToe::Game.new(players).play
    end
  end
end
