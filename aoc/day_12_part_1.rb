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

    @map[path.last].map do |adjacent|
      path + [adjacent]
    end.reject do |new_path|
      invalid_path? new_path
    end.sum do |new_path|
      count_paths new_path
    end
  end

  def invalid_path?(path)
    path.tally.select { |k,v| k.downcase == k }.values.any? { |v| v > 1 }
  end
end
