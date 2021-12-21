class AoC::Day21Part1
  class DeterministicDie
    def initialize
      @roll_count = 0
    end

    def roll
      @roll_count += 1

      (@roll_count - 1) % 100 + 1
    end

    def roll_count
      @roll_count
    end
  end

  def initialize(input = File.read("data/day21.txt"))
    @p1_pos, @p2_pos = *input.strip.split("\n").map { |line|
      line.split(" ").last.to_i
    }

    @p1_pos -= 1
    @p2_pos -= 1

    @p1_score = 0
    @p2_score = 0

    @die = DeterministicDie.new
  end

  def solution
    loop do
      move = @die.roll + @die.roll + @die.roll

      @p1_pos = (@p1_pos + move) % 10
      @p1_score += @p1_pos + 1

      if @p1_score >= 1000
        return @p2_score * @die.roll_count
      end

      move = @die.roll + @die.roll + @die.roll

      @p2_pos = (@p2_pos + move) % 10
      @p2_score += @p2_pos + 1

      if @p2_score >= 1000
        return @p1_score * @die.roll_count
      end
    end
  end
end
