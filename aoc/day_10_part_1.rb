class AoC::Day10Part1
  class Line
    PARENS = {
      "(" => ")",
      "[" => "]",
      "{" => "}",
      "<" => ">"
    }

    def initialize(chars)
      stack = []
      chars.each do |c|
        if PARENS.keys.include? c
          stack.push c
        elsif PARENS.values.include? c
          match = PARENS.fetch(stack.pop)

          if match != c
            @bad_char = c
            break
          end
        else
          raise "Unexpected char: #{c.inspect}"
        end
      end

      @autocomplete_string = stack.reverse.map { |c| PARENS[c] }.join('')
    end

    def corrupted?
      !!@bad_char
    end

    def syntax_error_score
      {
        ")" => 3,
        "]" => 57,
        "}" => 1197,
        ">" => 25137
      }[@bad_char]
    end

    def autocomplete_string
      @autocomplete_string
    end

    def autocomplete_score
      score = 0

      @autocomplete_string.split('').each do |c|
        score *= 5
        score += {
          ")" => 1,
          "]" => 2,
          "}" => 3,
          ">" => 4
        }[c]
      end

      score
    end
  end

  def initialize(input = File.read("data/day10.txt"))
    @lines = input.split("\n").map { |line| line.split('') }.map { |line|
      Line.new(line)
    }
  end

  def solution
    @lines.select(&:corrupted?).sum(&:syntax_error_score)
  end
end
