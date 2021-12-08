class AoC::Day7Part2 < AoC::Day7Part1
  private

  def fuel_cost(n)
    (@fuel_costs ||= Hash.new { |h, v|
      h[v] =
        if v == 0
          0
        elsif v == 1
          1
        else
          h[v - 1] + v
        end
    })[n]
  end
end
