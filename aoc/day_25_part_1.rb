class AoC::Day25Part1
  def initialize(input = File.read("data/day25.txt"))
    @state = input.strip.split("\n").each_with_index.flat_map { |line, y|
      line.split('').each_with_index.map { |c, x|
        [[x, y], c] unless c == "."
      }.compact
    }.to_h

    @height = @state.keys.map(&:last).max + 1
    @width = @state.keys.map(&:first).max + 1
  end

  def solution
    steps = 0

    state = @state
    loop do
      steps += 1
      new_state = advance(state)

      break if new_state == state

      state = new_state
    end

    steps
  end

  private

  def print(state)
    puts "\n"
    (0...@height).each do |y|
      puts((0...@width).map { |x| 
        state[[x, y]] || "."
      }.join)
    end
  end

  def advance(state)
    new_state = {}

    # East first
    state.each do |(x, y), c|
      if c == ">"
        dx = x + 1
        dx = 0 if dx >= @width

        if state[[dx, y]]
          new_state[[x, y]] = c
        else
          new_state[[dx, y]] = c
        end
      else
        new_state[[x, y]] = c
      end
    end

    state = new_state
    new_state = {}

    # Then South
    state.each do |(x, y), c|
      if c == "v"
        dy = y + 1
        dy = 0 if dy >= @height

        if state[[x, dy]]
          new_state[[x, y]] = c
        else
          new_state[[x, dy]] = c
        end
      else
        new_state[[x, y]] = c
      end
    end

    new_state
  end
end
