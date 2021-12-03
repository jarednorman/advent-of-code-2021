class AoC::Day2Part1
  def initialize(input = File.read("./data/day2.txt"))
    @instructions = input.split("\n").map { |line| command, argument = *line.split; [command, argument.to_i] }
    @position = 0
    @depth = 0
  end

  def solution
    @instructions.each do |command, argument|
      case command
      when "forward" then @position += argument
      when "down" then @depth += argument
      when "up" then @depth -= argument
      end
    end

    @position * @depth
  end
end
