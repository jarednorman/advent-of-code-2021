class AoC::Day17Part2 < AoC::Day17Part1
  def solution
    hits = Set.new

    (0..@x_range.end).each do |vx|
      next unless ever_hits_range?(vx)

      (@y_range.begin..(@y_range.begin.abs)).each do |vy|
        probe = Probe.new(x: 0, y: 0, vx: vx, vy: vy, max_y: 0)

        loop do
          probe = probe.step

          if probe.hit?(@x_range, @y_range)
            hits << [vx, vy]
            break
          elsif probe.overshot?(@x_range, @y_range)
            break
          end
        end
      end
    end

    hits.size
  end
end
