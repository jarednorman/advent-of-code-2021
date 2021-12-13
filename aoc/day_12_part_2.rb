class AoC::Day12Part2 < AoC::Day12Part1
  def invalid_path?(path)
    return true if path.count("start") != 1

    values = path.tally.select { |k,v| k.downcase == k }.values

    values.any? { |v| v > 2 } || values.count(2) > 1
  end
end
