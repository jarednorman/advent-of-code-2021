class AoC::Day8Part1
  def initialize(input = File.read("data/day8.txt"))
    @outputs = input.split("\n").map { |line| line.split(" | ").last }.flat_map { |output|
      output.split(" ")
    }
  end

  def solution
    @outputs.count { |digit| [2,3,4,7].include? digit.length }
  end
end
