class AoC::Day15Part1
  def initialize(input = File.read("data/day15.txt"))
    @at = {}
    @map = input.strip.split("\n").map { |l|
      l.split('').map(&:to_i)
    }.transpose
  end

  def solution
    visited = Set.new
    unvisited = []
    candidates = Set.new
    risks = Hash.new(Float::INFINITY)

    (0...width).each do |x|
      (0...height).each do |y|
        unvisited << [x, y]
      end
    end

    risks[[0, 0]] = 0
    candidates << [0, 0]

    size = width * height

    until visited.count == size
      if visited.count % 100 == 0
        puts "#{visited.count} out of #{size} nodes visited"
      end
      current = candidates.min_by { |node| risks[node] }

      neighbours(*current).each do |n|
        unless visited.include?(n)
          risks[n] = [
            risks[n],
            risks[current] + at(*n)
          ].min

          candidates << n
        end
      end

      unvisited.delete(current)
      candidates.delete(current)
      visited << current
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
