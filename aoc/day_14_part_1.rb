class AoC::Day14Part1
  class Polymer
    def initialize(template, rules)
      @rules = rules
      @hash = Hash.new(0)
      @start = template.split('').first
      @end = template.split('').last

      template.split('').each_cons(2) { |pair|
        @hash[pair] += 1
      }
    end

    def step
      new_hash = Hash.new(0)

      @hash.each { |pair, count|
        i = @rules[pair]
        a, b = *pair

        new_hash[[a, i]] += count
        new_hash[[i, b]] += count
      }

      @hash = new_hash
    end

    def answer
      counts = @hash.keys.flatten.uniq.map { |x|
        @hash.sum { |k,v|
          v * k.count(x)
        } +
          (x == @start ? 1 : 0) +
          (x == @end ? 1 : 0)
      }.sort

      (counts.last - counts.first) / 2
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
    iterations.times { @polymer.step }

    @polymer.answer
  end

  private

  def iterations
    10
  end
end
