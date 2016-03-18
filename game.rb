require_relative 'board'
# require_relative 'cursorable'

class Game
  include Cursorable
  def initialize
    if __FILE__ == $PROGRAM_NAME
      @board = Board.new
      @d = Display.new(@board)
      @cursor_pos = [0,0]
      @piece_selected = nil
      @d.render(@cursor_pos)
    end
    start_game
  end

  def start_game
    until game_over
      @cursor_pos = take_user_input
      if @piece_selected
        @board.show_valid_moves(@piece_selected)
      end
      @d.render(@cursor_pos)
      p @cursor_pos
    end
  end

  def take_user_input
    get_input(@cursor_pos)
  end

  def game_over
    false
  end

end


game = Game.new
