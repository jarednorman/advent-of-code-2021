class AoC::Day9Part2 < AoC::Day9Part1
  def solution
    low_points = []

    @map.each_cell { |cell|
      if @map.neighbours(cell).all? { |z| z.value > cell.value }
        low_points << cell
      end
    }

    z = low_points.map do |cell|
      basin = Set.new
      add_cell basin, cell

      basin
    end

    z.map(&:length).sort.reverse[0..2].inject(&:*)
  end

  private

  def add_cell(basin, cell)
    return if cell.value == 9 || basin.include?(cell)

    basin << cell

    @map.neighbours(cell).each { |c| add_cell basin, c }
  end
end
