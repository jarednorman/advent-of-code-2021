class AoC::Day7Part1
  def initialize(input = File.read("data/day7.txt"))
    @crabs = input.split(",").map(&:to_i)
  end

  def solution
    (@crabs.min..@crabs.max).map { |position|
      @crabs.sum { |crab|
        fuel_cost((position - crab).abs)
      }
    }.min
  end

  private

  def fuel_cost(n)
    n
  end
end
