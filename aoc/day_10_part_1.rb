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
