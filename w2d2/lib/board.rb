class Board
  attr_accessor :cups

  def initialize(name1, name2) #name 1 gets catch idx = 6, name2 gets idx = 13
    @cups = Array.new(14) { [] }
    place_stones
  end

  def place_stones
    @cups[0..5].each_index do |idx|
      4.times {@cups[idx] << :stone}
    end
  end

  def valid_move?(start_pos)
    if start_pos > @cups.length || [7,13].include?(start_pos)
      raise Exception, "Invalid starting cup"
    end
  end

  def make_move(start_pos, current_player_name)
    next_idx = start_pos # intialize

    @cups[start_pos].count.times do #The general framework, not done yet.
      next_idx += 1

      @cups[next_idx] << @cups[start_pos].pop
    end

    next_turn(next_idx)
  end

  def next_turn(ending_cup_idx)
    @cup[ending_cup_idx].count == 1 ? ending_cup_idx : :switch
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end
