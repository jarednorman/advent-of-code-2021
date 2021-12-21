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
    def p1_win?
      p1_score >= SCORE_LIMIT
    end

    def p2_win?
      p2_score >= SCORE_LIMIT
    end

    def next_states
      if p1_turn
        [1, 2, 3].map do |roll|
          new_p1_pos = (p1_pos + roll - 1) % 10 + 1

          State.new(
            p1_pos: new_p1_pos,
            p1_score: p1_score + new_p1_pos,

            p2_pos: p2_pos,
            p2_score: p2_score,

            p1_turn: false
          )
        end
      else
        [1, 2, 3].map do |roll|
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

  def solution
    initial = State.new(
      p1_pos: @p1_pos,
      p1_score: 0,

      p2_pos: @p2_pos,
      p2_score: 0,

      p1_turn: true
    )

    wins(initial).max
  end

  private

  def wins(state)
    return [1, 0] if state.p1_win?
    return [0, 1] if state.p2_win?

    state.next_states.map { |state| wins(state) }.transpose.map(&:sum)
  end
end
