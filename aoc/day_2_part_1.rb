class AoC::Day2Part1
  Command = Struct.new(:name, :argument)

  def initialize(input = File.read("./data/day2.txt"))
    @instructions = input.split("\n").map { |line|
      name, argument = *line.split
      Command.new(name, argument.to_i)
    }

    @position = 0
    @depth = 0
  end

  def solution
    @instructions.each do |command|
      case command.name
      when "forward" then @position += command.argument
      when "down" then @depth += command.argument
      when "up" then @depth -= command.argument
      end
    end

    @position * @depth
  end
end
