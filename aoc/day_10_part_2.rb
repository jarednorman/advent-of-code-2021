class AoC::Day10Part2 < AoC::Day10Part1
  def solution
    scores = @lines.reject(&:corrupted?).map(&:autocomplete_score)

    scores.sort[(scores.length / 2).floor]
  end
end
