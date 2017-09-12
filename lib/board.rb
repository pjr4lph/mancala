class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) {Array.new}
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, i|
      next if i == 6 || i == 13
      4.times do
        cup << :stones
      end
    end
  end

  def valid_move?(start_pos)
    raise "Can not start here" if start_pos < 0 || start_pos > 12
    raise "Can not start here" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)

  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups.take(6).all? {|cup| cup.empty?} || @cups.drop(6).all? {|cup| cup.empty? }
  end

  def winner
    player1_cups = @cups[6].count
    player2_cups = @cups[13].count
    if player1_cups == player2_cups
      :draw
    else
      if player1_cups > player2_cups
        return @name1
      else
        return @name2
      end
    end
  end

end
