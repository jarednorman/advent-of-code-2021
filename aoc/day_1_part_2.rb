class AoC::Day1Part2 < AoC::Day1Part1
  def steps
    @numbers
      .each_cons(3)
      .map(&:sum)
  end
end
