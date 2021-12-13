class AoC::Day11Part2 < AoC::Day11Part1
  def solution
    (1..).find { |n|
      @grid.step
      @grid.all_flashed?
    }
  end
end
