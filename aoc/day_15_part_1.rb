class AoC::Day15Part1
  def initialize(input = File.read("data/day15.txt"))
    @map = input.strip.split("\n").map { |l|
      l.split('').map(&:to_i)
    }.transpose
  end

  def solution
    @mins = {}

    min_path(width - 1, height - 1)
  end

  private

  def min_path(x, y)
    if (m = @mins[[x, y]])
      return m
    end
    return 0 if [x, y] == [0, 0]

    @mins[[x,y]] = neighbours(x, y)
      .map { |x,y| min_path(x, y) }
      .min + at(x, y)
  end

  def neighbours(x, y)
    [
      ([x, y - 1] if y > 0),
      ([x - 1, y] if x > 0)
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
