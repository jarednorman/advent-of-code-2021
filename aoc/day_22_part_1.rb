class AoC::Day22Part1
  class Step < Struct.new(:on, :cuboid, keyword_init: true)
    def self.parse(str, constrain_range: false)
      on, coordinates = *str.split(" ")
      xr, yr, zr = *eval(coordinates)

      x1 = constrain(xr.begin, constrain_range)
      x2 = constrain(xr.end + 1, constrain_range)
      y1 = constrain(yr.begin, constrain_range)
      y2 = constrain(yr.end + 1, constrain_range)
      z1 = constrain(zr.begin, constrain_range)
      z2 = constrain(zr.end + 1, constrain_range)

      cuboid = Cuboid.new(
        x1: x1,
        x2: x2,
        y1: y1,
        y2: y2,
        z1: z1,
        z2: z2
      )

      new(
        on: on == "on",
        cuboid: cuboid
      )
    end

    def self.constrain(v, constrain)
      return v unless constrain

      v.clamp(-50, 51)
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

      ox1 = other.x1.clamp(x1, x2)
      ox2 = other.x2.clamp(x1, x2)
      oy1 = other.y1.clamp(y1, y2)
      oy2 = other.y2.clamp(y1, y2)
      oz1 = other.z1.clamp(z1, z2)
      oz2 = other.z2.clamp(z1, z2)

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
