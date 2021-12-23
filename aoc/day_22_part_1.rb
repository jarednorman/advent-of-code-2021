class AoC::Day22Part1
  class Step < Struct.new(:on, :x, :y, :z, keyword_init: true)
    def self.parse(str)
      on, coordinates = *str.split(" ")
      x, y, z = *eval(coordinates)
      new(
        on: on == "on",
        x: constrain(x),
        y: constrain(y),
        z: constrain(z)
      )
    end

    def self.constrain(r)
      ([r.begin, -50].max)..([r.end, 50].min)
    end
  end

  def initialize(input = File.read("data/day22.txt"))
    @steps = input.strip.split("\n").map do |line|
      Step.parse(line)
    end
  end

  def solution
    cubes = Set.new

    @steps.each do |step|
      step.x.each do |x|
        next if x > 50 || x < -50
        step.y.each do |y|
          next if y > 50 || y < -50
          step.z.each do |z|
            next if z > 50 || z < -50

            if step.on
              cubes << [x, y, z]
            else
              cubes.delete [x, y, z]
            end
          end
        end
      end
    end

    cubes.size
  end
end
