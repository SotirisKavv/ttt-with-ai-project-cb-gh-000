class Board

  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} |  #{@cells[1]} |  #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} |  #{@cells[4]} |  #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} |  #{@cells[7]} |  #{@cells[8]} "
  end

  def position(input)
    @cells[input-1]
  end

  def full?
    !@cells.include?(" ")
  end

  def turn_count
    turn = 0
    @cells.each {|cell| turn += 1 if cell == "X" || cell == "O"}
  end

  def taken?(index)
    !self.position(index) == " "
  end

  def valid_move?(input)
    input >= 1 && input <= 9
  end

  def update

  end
end
