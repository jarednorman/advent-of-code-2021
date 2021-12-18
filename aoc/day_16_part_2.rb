class AoC::Day16Part2 < AoC::Day16Part1
  def solution
    parse_packet(@binary).evaluate
  end
end
