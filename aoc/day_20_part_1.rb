class AoC::Day20Part1
  class Image
    def initialize(pixels)
      @pixels = pixels
    end

    def enhance(algorithm)
      new_pixels = Set.new

      xs = @pixels.map(&:first)
      ys = @pixels.map(&:last)

      ((xs.min - 1)..(xs.max + 1)).each do |x|
        ((ys.min - 1)..(ys.max + 1)).each do |y|
          if algorithm[determine_index(x, y)] == other_pixel
            new_pixels << [x, y]
          end
        end
      end

      [DarkImage, LightImage].reject{|klass| klass == self.class}.first.new(new_pixels)
    end

    private

    def determine_index(x, y)
      [
        binary(x - 1, y - 1),
        binary(x,     y - 1),
        binary(x + 1, y - 1),
        binary(x - 1, y),
        binary(x,     y),
        binary(x + 1, y),
        binary(x - 1, y + 1),
        binary(x,     y + 1),
        binary(x + 1, y + 1)
      ].join('').to_i(2)
    end
  end

  class DarkImage < Image
    def pixel_count
      Float::INFINITY
    end

    def other_pixel
      "#"
    end

    private

    def binary(x, y)
      if @pixels.include?([x, y])
        "0"
      else
        "1"
      end
    end
  end

  class LightImage < Image
    def pixel_count
      @pixels.size
    end

    private

    def other_pixel
      "."
    end

    def binary(x, y)
      if @pixels.include?([x, y])
        "1"
      else
        "0"
      end
    end
  end

  def initialize(input = File.read("data/day20.txt"))
    @algorithm, image = input.strip.split("\n\n")
    raise "wrong length" unless @algorithm.length == 512

    pixels = image.split("\n")
      .map { |line| line.split("") }
      .each_with_index
      .flat_map { |line, y|
        line.each_with_index.map { |c, x|
          if c == "#"
            [x, y]
          end
        }.compact
      }.to_set

    @image = LightImage.new(pixels)
  end

  def solution
    iterations.times { @image = @image.enhance(@algorithm) }

    @image.pixel_count
  end

  private

  def iterations
    2
  end
end
