class AoC::Day21Part2 < AoC::Day21Part1
  SCORE_LIMIT = 21

  State = Struct.new(
    :p1_pos,
    :p2_pos,
    :p1_score,
    :p2_score,
    :p1_turn,
    keyword_init: true
  ) do
    def done?
      p1_win? || p2_win?
    end

    def p1_win?
      p1_score >= SCORE_LIMIT
    end

    def p2_win?
      p2_score >= SCORE_LIMIT
    end

    def next_states
      if p1_turn
        [1, 2, 3].flat_map do |roll_one|
          [1, 2, 3].flat_map do |roll_two|
            [1, 2, 3].map do |roll_three|
              roll = roll_one + roll_two + roll_three

              new_p1_pos = (p1_pos + roll - 1) % 10 + 1

              State.new(
                p1_pos: new_p1_pos,
                p1_score: p1_score + new_p1_pos,

                p2_pos: p2_pos,
                p2_score: p2_score,

                p1_turn: false
              )
            end
          end
        end
      else
        [1, 2, 3].flat_map do |roll_one|
          [1, 2, 3].flat_map do |roll_two|
            [1, 2, 3].map do |roll_three|
              roll = roll_one + roll_two + roll_three
              new_p2_pos = (p2_pos + roll - 1) % 10 + 1

              State.new(
                p1_pos: p1_pos,
                p1_score: p1_score,

                p2_pos: new_p2_pos,
                p2_score: p2_score + new_p2_pos,

                p1_turn: true
              )
            end
          end
        end
      end
    end
  end

  def solution
    initial = State.new(
      p1_pos: @p1_pos,
      p1_score: 0,

      p2_pos: @p2_pos,
      p2_score: 0,

      p1_turn: true
    )

    @done_states = Hash.new(0)

    states = Hash.new(0)
    states[initial] += 1

    loop do
      break if states.empty?

      new_states = Hash.new(0)

      states.each { |state, count|
        state.next_states.each do |next_state|
          if next_state.done?
            @done_states[next_state] += count
          else
            new_states[next_state] += count
          end
        end
      }

      states = new_states
    end

    [
      @done_states.select{|k,v|k.p1_win?}.sum{|k,v| v },
      @done_states.select{|k,v|k.p2_win?}.sum{|k,v| v }
    ].max
  end
end
