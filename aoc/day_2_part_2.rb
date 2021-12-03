class AoC::Day2Part2 < AoC::Day2Part1
  def solution
    @aim = 0

    @instructions.each do |command|
      case command.name
      when "down"
        @aim += command.argument
      when "up"
        @aim -= command.argument
      when "forward"
        @position += command.argument
        @depth += @aim * command.argument
      end
    end

    @position * @depth
  end
end
