class AoC::Day9Part1
  class HeightMap
    def initialize(data)
      @data = data
    end

    def width
      @data.length
    end

    def height
      @data.first.length
    end

    def each_cell
      @data.each_with_index { |row, x|
        row.each_with_index { |cell, y|
          yield cell, x, y
        }
      }
    end

    def neighbours(x, y)
      n = []

      n << cell(x - 1, y) if x > 0
      n << cell(x + 1, y) if x < width - 1
      n << cell(x, y - 1) if y > 0
      n << cell(x, y + 1) if y < height - 1

      n
    end

    def cell(x, y)
      @data[x][y]
    end
  end

  def initialize(input = File.read("data/day9.txt"))
    @map = HeightMap.new(
      input.split("\n").map { |line| line.split("").map(&:to_i) }.transpose
    )
  end

  def solution
    low_points = []

    @map.each_cell { |cell, x, y|
      if @map.neighbours(x, y).all? { |z| z > cell }
        low_points << cell
      end
    }

    low_points.sum + low_points.length
  end
end
