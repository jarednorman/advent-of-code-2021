class AoC::Day1Part1
  def initialize(input: File.read("data/day1.txt"))
    @numbers = input.split.map(&:to_i)
  end

  def solution
    @numbers.each_cons(2).count do |a, b|
      a < b
    end
  end
end
