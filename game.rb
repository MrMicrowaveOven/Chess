require_relative 'board'
# require_relative 'cursorable'

class Game
  include Cursorable
  def initialize
    if __FILE__ == $PROGRAM_NAME
      @board = Board.new
      @d = Display.new(@board)
      @cursor_pos = [0,0]
      @d.render(@cursor_pos)
    end
    start_game
  end

  def start_game
    until game_over
      @cursor_pos = take_user_input

      @d.render(@cursor_pos)
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
