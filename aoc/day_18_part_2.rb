class AoC::Day18Part2 < AoC::Day18Part1
  def solution
    @numbers.permutation(2).map { |a, b|
      (SnailfishNumber.parse(a) + SnailfishNumber.parse(b)).magnitude
    }.max
  end
end
