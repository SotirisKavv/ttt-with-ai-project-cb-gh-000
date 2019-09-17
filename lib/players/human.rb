class Players
  class Human < Player

      def move(board)
        puts "What move do you wanna make?"
        input = gets.strip
        board.update(input, self)
        input
      end

  end
end
