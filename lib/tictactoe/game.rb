module TicTacToe
  class Game
    attr_reader :player, :board, :current_player, :other_player

    def initialize(player, board = Board.new)
      @player = player
      @board = board
      @current_player, @other_player = player.shuffle
    end

    def switch_players
      @current_player, @other_player = @other_player, @current_player
    end

    def ask_turn
      "#{current_player.name}: Enter number between 1 and 9 to make move"
    end

    def get_move(hooman_move = gets.chomp)
      hooman_move_coordinate(hooman_move)
    end

    def game_over_message
      return "#{current_player.name} won!" if board.game_over == :winner
      return "the game ended with no winner" if board.game_over == :draw
    end

    def play
      puts "#{current_player.name} is randomly selected as the first play"
      while true
        board.formatted_grid
        puts ""
        puts ask_turn
        x, y = get_move
        board.set_cell(x, y, current_player.color)
        if board.game_over
          puts game_over_message
          board.formatted_grid
          return
        else
          switch_players
        end
      end
    end

    private

    def hooman_move_coordinate(human_move)
      mapping = {
        "1" => [0,0],
        "2" => [1,0],
        "3" => [2,0],
        "4" => [0,1],
        "5" => [1,1],
        "6" => [2,1],
        "7" => [0,2],
        "8" => [1,2],
        "9" => [2,2]
      }
      mapping[human_move]
    end
  end
end