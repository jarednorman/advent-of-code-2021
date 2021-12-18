class AoC::Day15Part1
  def initialize(input = File.read("data/day15.txt"))
    @map = input.strip.split("\n").map { |l|
      l.split('').map(&:to_i)
    }.transpose
  end

  def solution
    visited = {}
    risks = {}

    (0...width).each do |x|
      (0...height).each do |y|
        risks[[x, y]] = Float::INFINITY
      end
    end

    risks[[0, 0]] = 0

    until visited.count == risks.count
      current = risks
        .reject { |node, risk| visited[node] }
        .min_by(&:last)
        .first

      neighbours(*current).each do |n|
        risks[n] = [
          risks[n],
          risks[current] + at(*n)
        ].min
      end

      visited[current] = true
    end

    risks[[width - 1, height - 1]]
  end

  private

  def neighbours(x, y)
    [
      ([x, y - 1] if y > 0),
      ([x - 1, y] if x > 0),
      ([x, y + 1] if y < height - 1),
      ([x + 1, y] if x < width - 1),
    ].compact
  end

  def width
    @width ||= @map.length
  end

  def height
    @height ||= @map.first.length 
  end

  def at(x, y)
    @map[x][y]
  end
end
