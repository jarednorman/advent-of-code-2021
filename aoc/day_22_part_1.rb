class AoC::Day22Part1
  class Step < Struct.new(:on, :cuboid, keyword_init: true)
    def self.parse(str, constrain_range: false)
      on, coordinates = *str.split(" ")
      xr, yr, zr = *eval(coordinates)

      xr = constrain_range ? constrain(xr) : xr
      yr = constrain_range ? constrain(yr) : yr
      zr = constrain_range ? constrain(zr) : zr

      cuboid = Cuboid.new(
        x1: xr.begin, x2: xr.end,
        y1: yr.begin, y2: yr.end,
        z1: zr.begin, z2: zr.end
      )

      new(
        on: on == "on",
        cuboid: cuboid
      )
    end

    def self.constrain(r)
      ([[r.begin, -50].max, 50].min)..([[r.end + 1, 50].min, -50].max)
    end
  end

  Cuboid = Struct.new(
    :x1, :x2,
    :y1, :y2,
    :z1, :z2,
    keyword_init: true
  ) do
    def volume
      (x2 - x1) * (y2 - y1) * (z2 - z1)
    end

    def -(other)
      return [self] unless intersecting?(other)

      ox1 = [[other.x1, x1].max, x2].min
      ox2 = [[other.x1, x2].max, x2].min
      oy1 = [[other.y1, y1].max, y2].min
      oy2 = [[other.y1, y2].max, y2].min
      oz1 = [[other.z1, z1].max, z2].min
      oz2 = [[other.z1, z2].max, z2].min

      [
        Cuboid.new(x1: x1,  x2: x2,  y1: y1,  y2: y2,  z1: z1,  z2: oz1),
        Cuboid.new(x1: x1,  x2: x2,  y1: y1,  y2: y2,  z1: oz2, z2: z2),
        Cuboid.new(x1: x1,  x2: ox1, y1: y1,  y2: y2,  z1: oz1, z2: oz2),
        Cuboid.new(x1: ox2, x2: x2,  y1: y1,  y2: y2,  z1: oz1, z2: oz2),
        Cuboid.new(x1: ox1, x2: ox2, y1: y1,  y2: oy1, z1: oz1, z2: oz2),
        Cuboid.new(x1: ox1, x2: ox2, y1: oy2, y2: y2,  z1: oz1, z2: oz2),
      ].reject { |cuboid| cuboid.volume == 0 }
    end

    private

    def intersecting?(other)
      x1 < other.x2 && x2 > other.x1 &&
        y1 < other.y2 && y2 > other.y1 &&
        z1 < other.z2 && z2 > other.z1
    end
  end

  def initialize(input = File.read("data/day22.txt"))
    @steps = input.strip.split("\n").map { |line|
      Step.parse(line, constrain_range: constrain_range)
    }.reject { |step| step.cuboid.volume == 0 }
  end

  def solution
    cuboids = []

    @steps.each do |step|
      cuboids = cuboids.flat_map { |cuboid| cuboid - step.cuboid }
      cuboids << step.cuboid if step.on
    end

    cuboids.sum(&:volume)
  end

  private

  def constrain_range
    true
  end
end
