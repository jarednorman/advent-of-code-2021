class AoC::Day19Part2 < AoC::Day19Part1
  def solution
    # start with no beacons "resolved"
    first, *unresolved = *@scanners
    resolved = Set.new
    resolved_beacons = Set.new

    resolved << first
    first.location = Vector[0, 0, 0]
    resolved_beacons += first.beacons

    # search through additional beacons to find another match with resolved
    # repeat until all resolved
    until unresolved.empty?
      unresolved.each { |scanner|
        aligned = scanner.align_beacons(resolved_beacons)

        next unless aligned

        resolved << aligned
        resolved_beacons += aligned.beacons
        unresolved.delete(scanner)

        break
      }
    end

    resolved.map(&:location).combination(2).map { |a, b| a.to_a.zip(b.to_a).sum { |a, b| (a - b).abs } }.max
  end
end
