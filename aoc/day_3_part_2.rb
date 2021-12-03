class AoC::Day3Part2 < AoC::Day3Part1
  def solution
    oxygen * co2
  end

  private

  def oxygen
    input = @input.dup
    position = 0

    until input.length == 1
      digit = most_common_digit(position, input)

      input.select! { |value|
        value[position] == digit
      }

      position += 1
    end

    input.first.join.to_i(2)
  end

  def co2
    input = @input.dup
    position = 0

    until input.length == 1
      digit = least_common_digit(position, input)

      input.select! { |value|
        value[position] == digit
      }

      position += 1
    end

    input.first.join.to_i(2)
  end
end
