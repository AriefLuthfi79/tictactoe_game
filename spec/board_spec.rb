require 'spec_helper'

describe TicTacToe::Board do
  context "#initialize" do
    it "initialize the board with a grid" do
      expect { TicTacToe::Board.new(grid: "grid") }.to_not raise_error
    end

    it "creates three things in each row by default" do
      board = TicTacToe::Board.new
      expect(board.grid.length).to be(3)  
    end
  end

  context "#grid" do
    it "returns the grid if grid value not empty" do
      board = TicTacToe::Board.new(grid: "oke")
      expect(board.grid).to eq("oke") 
    end
  end
  
  context "#get_cell" do
    it "returns the based on the (x,y) coordinate" do
      grid = [["", "", ""], ["", "", "here am i"], ["", "", ""]]
      board = TicTacToe::Board.new(grid: grid)
      expect(board.get_cell(2,1)).to eq("here am i")
    end
  end

  context "#set_cell" do
    it "updates the value of cell with coordinate at (x, y)" do
      Person = Struct.new(:value)
      grid = [[Person.new("Arief"), "", ""], ["", "", ""], ["", "", ""]]
      board = TicTacToe::Board.new(grid: grid)
      expect(board.set_cell(0, 0, "Arief")).to eq("Arief")   
    end
  end

  TesCall = Struct.new(:value)
  let(:x_cell) { TesCall.new("X") }
  let(:y_cell) { TesCall.new("O") }
  let(:empty) { TesCall.new }

  context "#game_over" do
    it "return :winner if winner? is true" do
      board = TicTacToe::Board.new
      allow(board).to receive(:winner?) { true }
      expect(board.game_over).to eq :winner
    end

    it "return :draw if draw? is true and winner? is false" do
      board = TicTacToe::Board.new
      allow(board).to receive(:winner?) { false }
      allow(board).to receive(:draw?) { true }
      expect(board.game_over).to eq :draw  
    end
    
    it "return false if winner? false and draw? is false" do
      board = TicTacToe::Board.new
      allow(board).to receive(:winner?) { false }
      allow(board).to receive(:draw?) { false }
      expect(board.game_over).to be_falsey
    end

    it "return :winner if all_element are same (row must same)" do
      grid = [
        [x_cell, x_cell, x_cell],
        [y_cell, x_cell, y_cell],
        [y_cell, y_cell, empty ]
      ]
      board = TicTacToe::Board.new(grid: grid)
      expect(board.game_over).to eq :winner  
    end
    
    it "return :winner if all_element are diagonals" do
      grid = [
        [x_cell, empty, empty],
        [y_cell, x_cell, y_cell],
        [y_cell, y_cell, x_cell]
      ]

      board = TicTacToe::Board.new(grid: grid)
      expect(board.game_over).to eq :winner  
    end

    it "return :winner if all element vertical are same" do
      grid = [
        [x_cell, x_cell, empty],
        [y_cell, x_cell, y_cell],
        [y_cell, x_cell, empty ]
      ]
      board = TicTacToe::Board.new(grid: grid)
      expect(board.game_over).to eq :winner  
    end

    it "return :draw when all spane on the board are taken" do
      grid = [
        [y_cell, x_cell, y_cell],
        [x_cell, y_cell, y_cell],
        [x_cell, y_cell, x_cell ]
      ]
      board = TicTacToe::Board.new(grid: grid)
      expect(board.game_over).to eq :draw  
    end

    it "return false if when there is no winner or draw" do
      grid = [
        [x_cell, empty, empty],
        [y_cell, empty, empty],
        [y_cell, empty, empty ]
      ]
      board = TicTacToe::Board.new(grid: grid)
      expect(board.game_over).to be_falsey  
    end
  end
end
