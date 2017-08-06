class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until game_over
      take_turn
    end

    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    unless @game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    puts @seq
    clear
    puts "Please input the sequence (use a comma between words):"
  end

  def require_sequence
    input = gets.chomp.split(",")
    @game_over = true if input != @seq
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "Good work! Try the next round"
    clear
  end

  def game_over_message
    puts "Loser, try again next time"
    clear
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def clear
    sleep 1
    system "clear"
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Simon.new

  game.play
end
