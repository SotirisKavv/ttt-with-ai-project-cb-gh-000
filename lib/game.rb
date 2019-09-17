class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]
  ]

  def initialize(p1 = Players::Human.new("X"), p2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = p1
    @player_2 = p2
  end

  def current_player
    if self.board.turn_count % 2 == 0
      @player_1
    else
      @player_2
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combination|
      if @board.cells[combination[0]] == "X" && @board.cells[combination[1]] == "X" && @board.cells[combination[2]] == "X"
        return combination
      elsif @board.cells[combination[0]] == "O" && @board.cells[combination[1]] == "O" && @board.cells[combination[2]] == "O"
        return combination
      end
    end
    nil
  end

  def draw?
    @board.full? && self.won? == nil
  end

  def over?
    self.draw? || self.won? != nil
  end

  def winner
    if self.won? != nil
      @board.cells[self.won?[0]]
    end
  end

  def turn
    ret = ""
    while ret == "invalid"
      input = self.current_player.move(@board)
      if @board.valid_move?(input)
        ret = input
      else
        ret = "invalid"
      end
    end

  end

end
