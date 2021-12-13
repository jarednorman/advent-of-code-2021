class AoC::Day11Part1
  class Octopus
    def initialize(power)
      @power = power
      @flashed = false
    end

    def power
      @power
    end

    def increment
      @power += 1
    end

    def flash
      if !@flashed && @power > 9
        @flashed = true
      else
        false
      end
    end

    def reset
      flashed = @flashed
      @flashed = false
      @power = 0 if @power > 9
      return flashed
    end
  end

  class Grid
    def initialize(grid)
      @octopi = grid.map { |column| column.map { |power| Octopus.new(power) } }
    end

    def step
      @flashes = 0

      @octopi.flatten.each(&:increment)

      @octopi.each_with_index do |column, x|
        column.each_with_index do |octopus, y|
          flash(x, y)
        end
      end

      @all_flashed = @octopi.flatten.map(&:reset).all?

      @flashes
    end

    def all_flashed?
      @all_flashed
    end

    def print
      puts(@octopi.transpose.map { |row|
        row.map(&:power).join('')
      }.join("\n")+  "\n\n")
    end

    private

    def flash(x, y)
      return if x < 0 || y < 0
      return if x >= @octopi.length || y >= @octopi.first.length

      return unless @octopi[x][y].flash

      @flashes += 1

      [-1, 0, 1].each do |dx|
        [-1, 0, 1].each do |dy|
          next if [dx, dy] == [0, 0]

          increment(x + dx, y + dy)
          flash(    x + dx, y + dy)
        end
      end
    end

    def increment(x, y)
      return if x < 0 || y < 0
      return if x >= @octopi.length || y >= @octopi.first.length

      @octopi[x][y].increment
    end
  end

  def initialize(input = File.read("data/day11.txt"))
    @grid = Grid.new(input.split("\n").map { |line| line.split("").map(&:to_i) }.transpose)
  end

  def solution
    100.times.sum { |n|
      @grid.step
    }
  end
end
