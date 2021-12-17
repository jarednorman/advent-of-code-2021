class AoC::Day14Part1
  class Polymer
    def initialize(template, rules)
      @template = template.split('')
      @rules = rules
    end

    def template
      @template.join
    end

    def step
      @template = @template.each_cons(2).each_with_index.map { |pair, i|
        insertion = @rules[pair]

        if i == 0
          a, b = *pair
          [a, insertion, b]
        else
          [insertion, pair.last]
        end
      }.flatten
    end

    def answer
      counts = @template.tally.values
      min = counts.min
      max = counts.max

      max - min
    end
  end

  def initialize(input = File.read("data/day14.txt"))
    @template, @rules = *input.split("\n\n")

    @rules = @rules.strip.split("\n").map { |line|
      a, b = *line.split(" -> ")
      [a.split(''), b]
    }.to_h

    @polymer = Polymer.new(@template, @rules)
  end

  def solution
    10.times { @polymer.step }

    @polymer.answer
  end
end
