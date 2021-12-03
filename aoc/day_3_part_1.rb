class AoC::Day3Part1
  def initialize(input = File.read("./data/day3.txt"))
    @input = input.split("\n").map { |line| line.split('') }
  end

  def solution
    num = ""

    @input.first.each_with_index do |_, index|
      ones = @input.count { |x| x[index] == "1" }
      zeroes = @input.count { |x| x[index] == "0" }
      
      if ones > zeroes
        num += "1"
      else
        num += "0"
      end
    end

    gamma = num.to_i(2)
    epsilon = num.gsub("0", "a").gsub("1", "0").gsub("a", "1").to_i(2)

    gamma * epsilon
  end
end
