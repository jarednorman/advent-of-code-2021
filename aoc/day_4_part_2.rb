class AoC::Day4Part2 < AoC::Day4Part1
  def solution
    last_number = nil
    last_board = nil

    @numbers.each do |number|
      last_number = number

      @boards.each do |board|
        not_finished = !board.finished?

        board.call(number)

        last_board = board if not_finished && board.finished?
      end

      break if @boards.all?(&:finished?)
    end

    last_board.score * last_number
  end
end
