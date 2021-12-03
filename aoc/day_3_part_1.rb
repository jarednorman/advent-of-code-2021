class AoC::Day3Part1
  def initialize(input = File.read("./data/day3.txt"))
    @input = input.split("\n").map { |line| line.split('') }
  end

  def solution
    gamma = ""
    epsilon = ""

    bit_positions.each do |index|
      gamma += most_common_digit(index)
      epsilon += least_common_digit(index)
    end

    gamma.to_i(2) * epsilon.to_i(2)
  end

  private

  def bit_positions
    (0...@input.first.length)
  end

  def most_common_digit(index, input = @input)
    ones = input.count { |x| x[index] == "1" }
    zeroes = input.count { |x| x[index] == "0" }

    if ones >= zeroes
      "1"
    else
      "0"
    end
  end

  def least_common_digit(index, input = @input)
    ones = input.count { |x| x[index] == "1" }
    zeroes = input.count { |x| x[index] == "0" }

    if ones >= zeroes
      "0"
    else
      "1"
    end
  end
end
