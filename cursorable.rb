module Cursorable
  KEYMAP = {
    " " => :space,
    "\r" => :return,
    "\e[A" => :up,
    "\e[B" => :down,
    "\e[C" => :right,
    "\e[D" => :left,
    "\177" => :backspace,
    "\004" => :delete,
    "\u0003" => :ctrl_c,
  }

  MOVES = {
    left: [0, -1],
    right: [0, 1],
    up: [-1, 0],
    down: [1, 0]
  }

  def get_input(cursor_pos)
    @cursor_pos = cursor_pos

    key = KEYMAP[read_char]
    handle_key(key)
  end

  def handle_key(key)
    case key
    when :ctrl_c
      exit 0
    when :return, :space
      @cursor_pos
    when :left, :right, :up, :down
      update_pos(MOVES[key])
    else
      puts key
    end
  end

  def read_char
    STDIN.echo = false
    STDIN.raw!

    input = STDIN.getc.chr
    if input == "\e" then
      input << STDIN.read_nonblock(3) rescue nil
      input << STDIN.read_nonblock(2) rescue nil
    end
  ensure
    STDIN.echo = true
    STDIN.cooked!

    return input
  end


  def get_cursor_pos
    @cursor_pos
  end

  def update_pos(diff)
    # debugger
    new_pos = [@cursor_pos[0] + diff[0], @cursor_pos[1] + diff[1]]
    @cursor_pos = new_pos if in_bounds?(new_pos)
    # @cursor_pos
  end

  def in_bounds?(pos)
    row, col = pos
    row.between?(0, 7) && col.between?(0, 7)
  end

end
