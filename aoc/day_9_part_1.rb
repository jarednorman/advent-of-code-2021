class AoC::Day9Part1
  Cell = Struct.new(:value, :x, :y)

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
          yield Cell.new(cell, x, y)
        }
      }
    end

    def neighbours(cell)
      x = cell.x
      y = cell.y
      n = []

      n << cell(x - 1, y) if x > 0
      n << cell(x + 1, y) if x < width - 1
      n << cell(x, y - 1) if y > 0
      n << cell(x, y + 1) if y < height - 1

      n
    end

    def cell(x, y)
      Cell.new @data[x][y], x, y
    end
  end

  def initialize(input = File.read("data/day9.txt"))
    @map = HeightMap.new(
      input.split("\n").map { |line| line.split("").map(&:to_i) }.transpose
    )
  end

  def solution
    low_points = []

    @map.each_cell { |cell|
      if @map.neighbours(cell).all? { |z| z.value > cell.value }
        low_points << cell.value
      end
    }

    low_points.sum + low_points.length
  end
end
