require 'matrix'

class AoC::Day19Part1
  MATRICES = [
    [[1, 0, 0], [0, 1, 0], [0, 0, 1]],
    [[1, 0, 0], [0, 0, -1], [0, 1, 0]],
    [[1, 0, 0], [0, -1, 0], [0, 0, -1]],
    [[1, 0, 0], [0, 0, 1], [0, -1, 0]],

    [[0, -1, 0], [1, 0, 0], [0, 0, 1]],
    [[0, 0, 1], [1, 0, 0], [0, 1, 0]],
    [[0, 1, 0], [1, 0, 0], [0, 0, -1]],
    [[0, 0, -1], [1, 0, 0], [0, -1, 0]],

    [[-1, 0, 0], [0, -1, 0], [0, 0, 1]],
    [[-1, 0, 0], [0, 0, -1], [0, -1, 0]],
    [[-1, 0, 0], [0, 1, 0], [0, 0, -1]],
    [[-1, 0, 0], [0, 0, 1], [0, 1, 0]],

    [[0, 1, 0], [-1, 0, 0], [0, 0, 1]],
    [[0, 0, 1], [-1, 0, 0], [0, -1, 0]],
    [[0, -1, 0], [-1, 0, 0], [0, 0, -1]],
    [[0, 0, -1], [-1, 0, 0], [0, 1, 0]],

    [[0, 0, -1], [0, 1, 0], [1, 0, 0]],
    [[0, 1, 0], [0, 0, 1], [1, 0, 0]],
    [[0, 0, 1], [0, -1, 0], [1, 0, 0]],
    [[0, -1, 0], [0, 0, -1], [1, 0, 0]],

    [[0, 0, -1], [0, -1, 0], [-1, 0, 0]],
    [[0, -1, 0], [0, 0, 1], [-1, 0, 0]],
    [[0, 0, 1], [0, 1, 0], [-1, 0, 0]],
    [[0, 1, 0], [0, 0, -1], [-1, 0, 0]]
  ].map { |m| Matrix[*m] }

  class Scanner
    def initialize(name:, beacons:)
      @name = name
      @beacons = beacons
      @orientations = MATRICES.map do |m|
        beacons.map { |v| m * v }.to_set
      end
    end

    def align_beacons(other_beacons)
      @orientations.each do |oriented_beacons|
        oriented_beacons.each do |b1|
          other_beacons.each do |b2|
            d = b1 - b2

            translated_beacons = oriented_beacons.map { |b| b - d }.to_set

            if (translated_beacons & other_beacons).size >= 12
              puts "found alignment for #{name}"
              return translated_beacons
            end
          end
        end
      end

      false
    end

    attr_reader :name, :beacons
  end

  def initialize(input = File.read("data/day19.txt"))
    @scanners = input.strip.split("\n\n").map { |scanner|
      name, *beacons = *scanner.split("\n")

      Scanner.new(
        name: /--- (.*) ---/.match(name)[1],
        beacons: Set[*beacons.map { |b| Vector[*b.split(",").map(&:to_i)] }]
      )
    }
  end

  def solution
    # start with no beacons "resolved"
    map = Set.new
    unresolved = @scanners

    # compare beacons to find one with at least 12 matches
    unresolved.combination(2).each { |a, b|
      beacons = a.align_beacons(b.beacons)

      next unless beacons

      map += b.beacons
      map += beacons
      unresolved.delete(a)
      unresolved.delete(b)

      break
    }

    # search through additional beacons to find another match with resolved
    # repeat until all resolved
    until unresolved.empty?
      unresolved.each { |scanner|
        beacons = scanner.align_beacons(map)

        next unless beacons

        map += beacons
        unresolved.delete(scanner)

        break
      }
    end

    # count 'em
    map.size
  end
end
