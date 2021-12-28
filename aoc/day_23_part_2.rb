class AoC::Day23Part2
  COSTS = {
    "A" => 1,
    "B" => 10,
    "C" => 100,
    "D" => 1000
  }

  FINAL = {
    [2, 1] => "A",
    [2, 2] => "A",
    [2, 3] => "A",
    [2, 4] => "A",
    [4, 1] => "B",
    [4, 2] => "B",
    [4, 3] => "B",
    [4, 4] => "B",
    [6, 1] => "C",
    [6, 2] => "C",
    [6, 3] => "C",
    [6, 4] => "C",
    [8, 1] => "D",
    [8, 2] => "D",
    [8, 3] => "D",
    [8, 4] => "D",
  }

  State = Struct.new(:positions) do
    def self.parse(input)
      letters = input.strip.gsub(/\W/, '')

      new({
        [2, 1] => letters[0],
        [4, 1] => letters[1],
        [6, 1] => letters[2],
        [8, 1] => letters[3],
        [2, 2] => "D",
        [4, 2] => "C",
        [6, 2] => "B",
        [8, 2] => "A",
        [2, 3] => "D",
        [4, 3] => "B",
        [6, 3] => "A",
        [8, 3] => "C",
        [2, 4] => letters[4],
        [4, 4] => letters[5],
        [6, 4] => letters[6],
        [8, 4] => letters[7],
      })
    end

    def cheapest_cost(cost, seen)
      # We can cheat and optimize here:
      return if cost > 55000

      return if seen[self] && seen[self] <= cost

      seen[self] = cost

      return cost if done?

      next_states.sort_by { |state, additional_cost|
        [-state.correctness, additional_cost]
      }.map { |state, additional_cost|
        state.cheapest_cost(cost + additional_cost, seen)
      }.compact.min
    end

    def next_states
      positions.keys.flat_map { |x, y|
        if y >= 1
          # This means we're in a room.

          # Do nothing if we're stuck in our room.
          if y > 1
            next [] if (y - 1).downto(1).any? { |y| positions[[x, y]] }
          end

          # Do nothing if we're already where we belong.
          next [] if correct?([x, y])

          # Examine visiting all possible hallway end locations.
          [0, 1, 3, 5, 7, 9, 10].map { |hallway_x|
            next unless passable?(x, hallway_x)

            additional_cost = ((x - hallway_x).abs + y) * COSTS[positions[[x, y]]]

            new_positions = positions.dup
            new_positions[[hallway_x, 0]] = new_positions.delete([x, y])

            [self.class.new(new_positions), additional_cost]
          }.compact
        else
          destinations = {
            "A" => [[2, 4], [2, 3], [2, 2], [2, 1]],
            "B" => [[4, 4], [4, 3], [4, 2], [4, 1]],
            "C" => [[6, 4], [6, 3], [6, 2], [6, 1]],
            "D" => [[8, 4], [8, 3], [8, 2], [8, 1]],
          }[positions[[x, y]]]
         
          dest = destinations.find { |dx, dy| positions[[dx, dy]].nil? }

          next [] unless dest
          next [] unless passable?(x, dest.first)

          if dest.last != 4
            next [] unless (dest.last + 1).upto(4).all? { |y|
              correct?([dest.first, y])
            }
          end

          additional_cost =
            ((x - dest.first).abs + (y - dest.last).abs) * COSTS[positions[[x, y]]]

          new_positions = positions.dup
          new_positions[dest] = new_positions.delete([x, y])

          [[self.class.new(new_positions), additional_cost]]
        end
      }.to_h
    end

    def correctness
      c = 0

      if positions[[2, 4]] == "A"
        c += 1
        if positions[[2, 3]] == "A"
          c += 1
          if positions[[2, 2]] == "A"
            c += 1
            if positions[[2, 1]] == "A"
              c += 1
            end
          end
        end
      end

      if positions[[4, 4]] == "B"
        c += 1
        if positions[[4, 3]] == "B"
          c += 1
          if positions[[4, 2]] == "B"
            c += 1
            if positions[[4, 1]] == "B"
              c += 1
            end
          end
        end
      end

      if positions[[6, 4]] == "C"
        c += 1
        if positions[[6, 3]] == "C"
          c += 1
          if positions[[6, 2]] == "C"
            c += 1
            if positions[[6, 1]] == "C"
              c += 1
            end
          end
        end
      end

      if positions[[8, 4]] == "D"
        c += 1
        if positions[[8, 3]] == "D"
          c += 1
          if positions[[8, 2]] == "D"
            c += 1
            if positions[[8, 1]] == "D"
              c += 1
            end
          end
        end
      end

      c
    end

    def done?
      FINAL.all? do |pos, letter|
        positions[pos] == letter
      end
    end

    def correct?(pos)
      if pos.last == 0
        return false
      elsif pos.last == 4
        FINAL[pos] == positions[pos]
      elsif pos.last == 3
        FINAL[pos] == positions[pos] && correct?([pos.first, 4])
      elsif pos.last == 2
        FINAL[pos] == positions[pos] && correct?([pos.first, 3])
      elsif pos.last == 1
        FINAL[pos] == positions[pos] && correct?([pos.first, 2])
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
        
        correctness: #{correctness}
        #############
        ##{(0..10).map { |x| positions[[x, 0]] || "." }.join}#
        ####{positions[[2, 1]] || "."}##{positions[[4, 1]] || "."}##{positions[[6, 1]] || "."}##{positions[[8, 1]] || "."}###
          ##{positions[[2, 2]] || "."}##{positions[[4, 2]] || "."}##{positions[[6, 2]] || "."}##{positions[[8, 2]] || "."}#
          ##{positions[[2, 3]] || "."}##{positions[[4, 3]] || "."}##{positions[[6, 3]] || "."}##{positions[[8, 3]] || "."}#
          ##{positions[[2, 4]] || "."}##{positions[[4, 4]] || "."}##{positions[[6, 4]] || "."}##{positions[[8, 4]] || "."}#
          #########
      STR
    end
  end

  def initialize(input = File.read("data/day23.txt"))
    @initial = State.parse(input)
  end

  def solution
    seen = {}
    @initial.cheapest_cost(0, seen)
  end
end
