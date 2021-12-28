class AoC::Day23Part1
  COSTS = {
    "A" => 1,
    "B" => 10,
    "C" => 100,
    "D" => 1000
  }

  FINAL = {
    [2, 1] => "A",
    [2, 2] => "A",
    [4, 1] => "B",
    [4, 2] => "B",
    [6, 1] => "C",
    [6, 2] => "C",
    [8, 1] => "D",
    [8, 2] => "D",
  }

  State = Struct.new(:positions, :cost) do
    def self.parse(input)
      letters = input.strip.gsub(/\W/, '')

      new({
        [2, 1] => letters[0],
        [4, 1] => letters[1],
        [6, 1] => letters[2],
        [8, 1] => letters[3],
        [2, 2] => letters[4],
        [4, 2] => letters[5],
        [6, 2] => letters[6],
        [8, 2] => letters[7],
      }, 0)
    end

    def cheapest_cost
      binding.pry if done?
      return cost if done?

      # Shhhh
      return if cost > 12521

      print

      next_states.sort_by { |state|
        state.correctness
      }.reverse.map(&:cheapest_cost).compact.min
    end

    def next_states
      positions.keys.flat_map { |x, y|
        if y >= 1
          # This means we're in a room.

          # Do nothing if we're stuck in our room.
          next [] if y == 2 && positions[[x, 1]]

          # Do nothing if we're already where we belong.
          next [] if correct?([x, y])

          [0, 1, 3, 5, 7, 9, 10].map { |hallway_x|
            next unless passable?(x, hallway_x)

            additional_cost = ((x - hallway_x).abs + y) * COSTS[positions[[x, y]]]

            new_positions = positions.dup
            new_positions[[hallway_x, 0]] = new_positions.delete([x, y])

            self.class.new(new_positions, additional_cost + cost)
          }.compact
        else
          destinations = {
            "A" => [[2, 2], [2, 1]],
            "B" => [[4, 2], [4, 1]],
            "C" => [[6, 2], [6, 1]],
            "D" => [[8, 2], [8, 1]],
          }[positions[[x, y]]]
         
          dest = destinations.find { |dx, dy| positions[[dx, dy]].nil? }

          next [] unless dest
          next [] unless passable?(x, dest.first)

          additional_cost =
            ((x - dest.first).abs + (y - dest.last).abs) * COSTS[positions[[x, y]]]

          new_positions = positions.dup
          new_positions[dest] = new_positions.delete([x, y])

          [self.class.new(new_positions, additional_cost + cost)]
        end
      }
    end

    def correctness
      FINAL.count do |pos, letter|
        positions[pos] == letter
      end
    end

    def done?
      FINAL.all? do |pos, letter|
        positions[pos] == letter
      end
    end

    def correct?(pos)
      if pos.last == 0
        return false
      elsif pos.last == 1
        FINAL[pos] == positions[pos] && correct?([pos.first, 2])
      else
        FINAL[pos] == positions[pos]
      end
    end

    def passable?(start, finish)
      if start < finish
        (start + 1).upto(finish).all? { |x|
          positions[[x, 0]].nil?
        }
      else
        (start - 1).downto(finish).all? { |x|
          positions[[x, 0]].nil?
        }
      end
    end

    def print
      puts <<~STR
        
        Cost: #{cost}
        #############
        ##{(0..10).map { |x| positions[[x, 0]] || "." }.join}#
        ####{positions[[2, 1]] || "."}##{positions[[4, 1]] || "."}##{positions[[6, 1]] || "."}##{positions[[8, 1]] || "."}###
          ##{positions[[2, 2]] || "."}##{positions[[4, 2]] || "."}##{positions[[6, 2]] || "."}##{positions[[8, 2]] || "."}#
          #########
      STR
    end
  end

  def initialize(input = File.read("data/day23.txt"))
    @initial = State.parse(input)
  end

  def solution
    @initial.cheapest_cost
  end
end
