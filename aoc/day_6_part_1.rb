class AoC::Day6Part1
  State = Struct.new(:fishes) do
    def count
      fishes.length
    end

    def next
      new_fishes = 0

      self.class.new(
        fishes.map do |fish|
          if fish == 0
            new_fishes += 1
            6
          else
            fish - 1
          end
        end + Array.new(new_fishes, 8)
      )
    end
  end

  def initialize(input = File.read("data/day6.txt"))
    @state = State.new(input.split(",").map(&:to_i))
  end

  def solution
    80.times do
      @state = @state.next
    end

    @state.count
  end
end
