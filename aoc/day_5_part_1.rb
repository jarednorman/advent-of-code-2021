class AoC::Day5Part1
  class Vent
    def initialize(spec)
      @start, @finish = *spec.split(" -> ").map do |coord|
        coord.split(",").map(&:to_i)
      end
    end

    def coordinates
      if @start[0] == @finish[0] # vertical
        start, finish = *[@start[1], @finish[1]].sort

        (start..finish).map do |y|
          [@start[0], y]
        end
      elsif @start[1] == @finish[1] # horizontal
        start, finish = *[@start[0], @finish[0]].sort

        (start..finish).map do |x|
          [x, @start[1]]
        end
      else
        range(@start[0], @finish[0]).zip range(@start[1], @finish[1])
      end
    end

    def diagonal?
      @start[0] != @finish[0] && @start[1] != @finish[1]
    end

    private

    def range(a, b)
      if a > b
        a.downto(b)
      else
        a.upto(b)
      end
    end
  end

  def initialize(input = File.read("data/day5.txt"))
    @vents = input.split("\n").map do |vent_spec|
      Vent.new(vent_spec)
    end
  end

  def solution
    @vents.each do |vent|
      next if exclude?(vent)

      vent.coordinates.each do |x, y|
        floor[[x, y]] += 1
      end
    end

    floor.values.count { |x| x >= 2 }
  end

  private

  def floor
    @floor ||= Hash.new(0)
  end

  def exclude?(vent)
    vent.diagonal?
  end
end
