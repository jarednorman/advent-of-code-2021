class AoC::Day6Part1
  State = Struct.new(:fishes) do
    def count
      fishes.values.sum
    end

    def next
      self.class.new({
        0 => fishes.fetch(1, 0),
        1 => fishes.fetch(2, 0),
        2 => fishes.fetch(3, 0),
        3 => fishes.fetch(4, 0),
        4 => fishes.fetch(5, 0),
        5 => fishes.fetch(6, 0),
        6 => fishes.fetch(7, 0) + fishes.fetch(0, 0),
        7 => fishes.fetch(8, 0),
        8 => fishes.fetch(0, 0)
      })
    end
  end

  def initialize(input = File.read("data/day6.txt"))
    @state = State.new(
      input.split(",").map(&:to_i).tally
    )
  end

  def solution
    iterations.times do
      @state = @state.next
    end

    @state.count
  end

  private

  def iterations
    80
  end
end
