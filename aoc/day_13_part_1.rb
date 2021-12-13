class AoC::Day13Part1
  class Paper < Struct.new(:dots)
    def fold(x: nil, y: nil)
      raise unless x || y

      if y
        self.class.new(
          dots.map { |dot|
            next dot if dot.last < y

            [dot.first, y - (dot.last - y)]
          }.uniq
        )
      else
        self.class.new(
          dots.map { |dot|
            next dot if dot.first < x

            [x - (dot.first - x), dot.last]
          }.uniq
        )
      end
    end
  end

  def initialize(input = File.read("data/day13.txt"))
    dots, folds = *input.split("\n\n")

    @paper = Paper.new(dots.split("\n").map{|d|d.split(",").map(&:to_i)})

    @folds = folds.split("\n").map { |f|
      _, axis, z = */fold along (x|y)=(\d+)/.match(f)
      [axis, z.to_i]
    }
  end

  def solution
    @paper =
      case @folds.first.first
      when "x" then @paper.fold(x: @folds.first.last)
      when "y" then @paper.fold(y: @folds.first.last)
      else
        raise "wat"
      end

    @paper.dots.count
  end
end
