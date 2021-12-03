class AoC::Day2Part2 < AoC::Day2Part1
  def solution
    @aim = 0

    @instructions.each do |command, argument|
      case command
      when "down"
        @aim += argument
      when "up"
        @aim -= argument
      when "forward"
        @position += argument
        @depth += @aim * argument
      end
    end

    @position * @depth
  end
end
