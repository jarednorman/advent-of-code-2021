class AoC::Day22Part1
  class Step < Struct.new(:on, :x, :y, :z, keyword_init: true)
    def self.parse(str, constrain_range: false)
      on, coordinates = *str.split(" ")
      x, y, z = *eval(coordinates)
      new(
        on: on == "on",
        x: constrain_range ? constrain(x) : x,
        y: constrain_range ? constrain(y) : y,
        z: constrain_range ? constrain(z) : z
      )
    end

    def self.constrain(r)
      ([r.begin, -50].max)..([r.end, 50].min)
    end
  end

  def initialize(input = File.read("data/day22.txt"))
    @steps = input.strip.split("\n").map do |line|
      Step.parse(line, constrain_range: constrain_range)
    end
  end

  def solution
    count = 0

    @steps = @steps.reverse

    x_steps =
      @steps.flat_map{|s|[s.x.begin, s.x.end + 1]}.uniq.sort.each_cons(2)

    y_steps =
      @steps.flat_map{|s|[s.y.begin, s.y.end + 1]}.uniq.sort.each_cons(2)

    z_steps =
      @steps.flat_map{|s|[s.z.begin, s.z.end + 1]}.uniq.sort.each_cons(2)

    x_steps.each do |start_x, end_x|
      next unless x_on?(start_x)

      y_steps.each do |start_y, end_y|
        next unless xy_on?(start_x, start_y)

        z_steps.each do |start_z, end_z|
          next unless on?(start_x, start_y, start_z)

          count +=
            (end_x - start_x) *
            (end_y - start_y) *
            (end_z - start_z)
        end
      end
    end

    count
  end

  private

  def x_on?(x)
    if (step = @steps.find { |s| s.on && s.x.cover?(x) })
      return true
    end

    false
  end

  def xy_on?(x, y)
    if (step = @steps.find { |s| s.on && s.x.cover?(x) && s.y.cover?(y) })
      return true
    end

    false
  end

  def on?(x, y, z)
    if (step = @steps.find { |s| s.x.cover?(x) && s.y.cover?(y) && s.z.cover?(z) })
      return step.on
    end

    false
  end

  def constrain_range
    true
  end
end
