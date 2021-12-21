require 'matrix'

class AoC::Day19Part1
  ORDER = %w[0 10 11 25 1 7 14 18 17 27
             21 5 3 22 8 2 9 13 15 6
             12 16 19 23 24 26 28 4 20 29].map { |n| "scanner #{n}" }

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
    def initialize(name:, beacons:, location: nil)
      @name = name
      @beacons = beacons
      @orientations = MATRICES.map do |m|
        beacons.map { |v| m * v }.to_set
      end
      @location = location
    end

    attr_accessor :location

    def align_beacons(other_beacons)
      @orientations.each do |oriented_beacons|
        oriented_beacons.each do |b1|
          # do something smarter
          other_beacons.each do |b2|
            d = b1 - b2

            translated_beacons = oriented_beacons.map { |b| b - d }.to_set

            if (translated_beacons & other_beacons).size >= 12
              return self.class.new(
                name: name,
                beacons: translated_beacons,
                location: d
              )
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
    }.sort_by { |scanner| ORDER.index(scanner.name) }
  end

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

    # count 'em
    resolved_beacons.size
  end
end
