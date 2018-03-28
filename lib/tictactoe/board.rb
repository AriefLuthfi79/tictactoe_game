module TicTacToe
  class Board
    attr_reader :grid
    def initialize(input = {})
      @grid = input.fetch(:grid, default_grid)
    end

    def get_cell(x, y)
      grid[y][x]
    end

    def set_cell(x, y, val)
      get_cell(x, y).value = val
    end

    def game_over
      return :winner if winner?
      return :draw if draw?
      false
    end

    def formatted_grid
      grid.each do |row|
        puts row.map { |cell| cell.value.empty? ? "_" : cell.value }.join(" ")
      end
    end

    private

    def default_grid
      Array.new(3) do
        Array.new(3) do
          TicTacToe::Cell.new 
        end
      end
    end

    def winner?
      winning_positions.each do |element|
        next if winning_positions_values(element).all_empty?
        return true if winning_positions_values(element).all_same?
      end
      false
    end

    def winning_positions
      grid + grid.transpose + diagonals
    end

    def winning_positions_values(winning_positions)
      winning_positions.map do |e|
        e.value
      end
    end

    def draw?
      grid.flatten.map { |e| e.value }.none_empty?
    end

    def diagonals
      [
        [get_cell(0,0), get_cell(1,1), get_cell(2,2)],
        [get_cell(0,2), get_cell(1,1), get_cell(2,0)]
      ]
    end
  end
end