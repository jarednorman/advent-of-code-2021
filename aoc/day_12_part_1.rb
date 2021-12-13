class AoC::Day12Part1
  def initialize(input = File.read("data/day12.txt"))
    @map = Hash.new { |h, k| h[k] = [] }

    input.split("\n").each do |pair|
      a, b = *pair.split("-")

      @map[a] << b
      @map[b] << a
    end
  end

  def solution
    path = ["start"]

    count_paths(path)
  end

  private

  def count_paths(path)
    return 1 if path.last == "end"

    @map[path.last].reject do |adjacent|
      adjacent.downcase == adjacent && path.include?(adjacent)
    end.sum do |adjacent|
      count_paths(path + [adjacent])
    end
  end
end
