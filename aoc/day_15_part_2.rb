class AoC::Day15Part2 < AoC::Day15Part1
  def width
    @width ||= @map.length * 5
  end

  def height
    @height ||= @map.first.length * 5
  end

  def at(x, y)
    @at[[x, y]] ||=
      begin
        real_x = x % @map.length
        real_y = y % @map.first.length
        dx = x / @map.length
        dy = y / @map.first.length
        (@map[real_x][real_y] - 1 + dx + dy) % 9 + 1
      end
  end
end
