class AoC::Day17Part1
  class Probe < Struct.new(:x, :y, :vx, :vy, :max_y, keyword_init: true)
    def step
      self.class.new(
        x: x + vx,
        y: y + vy,
        vx: (
          if vx == 0
            0
          elsif vx > 0
            vx - 1
          elsif vx < 0
            vx + 1
          end
        ),
        vy: vy - 1,
        max_y: [max_y, y + vy].max
      )
    end

    def hit?(x_range, y_range)
      x_range.cover?(x) && y_range.cover?(y)
    end

    def overshot?(x_range, y_range)
      x > x_range.end || y < y_range.begin
    end
  end

  def initialize(input = File.read("data/day17.txt"))
    _, x_range, y_range = */.*: x=(.*), y=(.*)/.match(input.strip)

    @x_range = eval x_range
    @y_range = eval y_range
  end

  def solution
    hits = []

    # (0..@x_range.end).each do |vx|
    #   next unless ever_hits_range?(vx)
      (0..500).each do |vy|
        probe = Probe.new(x: 0, y: 0, vx: 0, vy: vy, max_y: 0)

        loop do
          probe = probe.step

          if probe.hit?(-1..1, @y_range)
            hits << [probe.max_y, vy]
            break
          elsif probe.overshot?(-1..1, @y_range)
            break
          end
        end
      end
    # end

    hits.map(&:first).max
  end

  # def ever_hits_range?(vx)
  #   x = 0

  #   loop do
  #     return true if @x_range.cover?(x)
  #     return false if vx == 0 || x > @x_range.end

  #     x += vx
  #     vx -= 1
  #   end
  # end
end
