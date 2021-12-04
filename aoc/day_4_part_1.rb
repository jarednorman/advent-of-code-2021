class AoC::Day4Part1
  class Cell
    def initialize(number)
      @number = number
      @called = false
    end

    def call(number)
      @called = true if number == @number
    end

    def called?
      @called
    end

    def number
      @number
    end
  end

  class Board
    def initialize(board)
      @nums = board.split("\n").map { |row|
        row
          .strip
          .split(/\s+/)
          .map(&:to_i)
          .map { |number| Cell.new(number) }
      }
    end

    def call(number)
      @nums.flatten.each do |cell|
        cell.call(number)
      end
    end

    def finished?
      @nums.any? do |row|
        row.all?(&:called?)
      end || @nums.transpose.any? do |column|
        column.all?(&:called?)
      end
    end

    def score
      @nums.flatten.reject(&:called?).sum(&:number)
    end
  end

  def initialize(input = File.read("./data/day4.txt"))
    numbers, *boards = input.split("\n\n")

    @numbers = numbers.split(",").map(&:to_i)
    @boards = boards.map { |board| Board.new(board) }
  end

  def solution
    last_number = nil

    @numbers.each do |number|
      last_number = number

      @boards.each do |board|
        board.call(number)
      end

      break if @boards.any?(&:finished?)
    end

    @boards.find(&:finished?).score * last_number
  end
end
