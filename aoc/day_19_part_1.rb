class AoC::Day19Part1
  class Scanner
    def initialize(name:, beacons:)
      @name = name
      @beacons = beacons
    end

    def is_congruent_with?(other_beacons)
      true
    end

    def align_beacons(other_beacons)
      beacons
    end

    attr_reader :name, :beacons
  end

  def initialize(input = File.read("data/day19.txt"))
    @scanners = input.strip.split("\n\n").map { |scanner|
      name, *beacons = *scanner.split("\n")

      Scanner.new(
        name: /--- (.*) ---/.match(name)[1],
        beacons: beacons.map { |b| b.split(",").map(&:to_i) }
      )
    }
  end

  def solution
    # start with no beacons "resolved"
    map = Set.new
    unresolved = @scanners

    # compare beacons to find one with at least 12 matches
    matches = unresolved.combination(2).find { |a, b| a.is_congruent_with?(b.beacons) }

    # "resolve" those beacons
    map += matches.first.beacons
    map += matches.last.align_beacons(map)
    unresolved.delete(matches.first)
    unresolved.delete(matches.last)

    # search through additional beacons to find another match with resolved
    # repeat until all resolved
    until unresolved.empty?
      scanner = unresolved.find { |scanner| scanner.is_congruent_with?(map) }

      map += scanner.align_beacons(map)
      unresolved.delete(scanner)
    end

    # count 'em
    map.size
  end
end
