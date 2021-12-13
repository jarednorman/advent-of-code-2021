class AoC::Day13Part2 < AoC::Day13Part1
  def solution
    @folds.each do |f|
      @paper =
        case f.first
        when "x" then @paper.fold(x: f.last)
        when "y" then @paper.fold(y: f.last)
        else
          raise "wat"
        end
    end

    @paper.print
  end
end
