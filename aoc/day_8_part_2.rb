class AoC::Day8Part2 < AoC::Day8Part1
  #   0:      6:      9:
  #  aaaa    aaaa    aaaa
  # b    c  b    .  b    c
  # b    c  b    .  b    c
  #  ....    dddd    dddd
  # e    f  e    f  .    f
  # e    f  e    f  .    f
  #  gggg    gggg    gggg
  #
  #   2:      3:      5:  
  #  aaaa    aaaa    aaaa 
  # .    c  .    c  b    .
  # .    c  .    c  b    .
  #  dddd    dddd    dddd 
  # e    .  .    f  .    f
  # e    .  .    f  .    f
  #  gggg    gggg    gggg  
  #
  #   1:      4:      7:      8:   
  #  ....    ....    aaaa    aaaa  
  # .    c  b    c  .    c  b    c 
  # .    c  b    c  .    c  b    c 
  #  ....    dddd    ....    dddd  
  # .    f  .    f  .    f  e    f 
  # .    f  .    f  .    f  e    f 
  #  ....    ....    ....    gggg  

  class Output
    def initialize(signals, digits)
      signals = signals.map { |s| Set.new(s.split("")) }
      digits = digits.map { |s| Set.new(s.split("")) }

      one = signals.find { |s| s.length == 2 }
      four = signals.find { |s| s.length == 4 }
      seven = signals.find { |s| s.length == 3 }
      eight = signals.find { |s| s.length == 7 }
      six = signals.find { |s| s.length == 6 && (one & s).length == 1 }
      c = (one - six).first
      five = signals.find { |s| s.length == 5 && !s.include?(c) }
      three = signals.find { |s| s.length == 5 && (one & s).length == 2 }
      two = signals.find { |s| s.length == 5 && ![three, five].include?(s) }
      zero = signals.find { |s|
        s.length == 6 &&
          s != six &&
          (s & four).length == 3
      }
      nine = signals.find { |s| s.length == 6 && ![zero, six].include?(s) }

      @output = digits.map { |d|
        if d == one
          "1"
        elsif d == two
          "2"
        elsif d == three
          "3"
        elsif d == four
          "4"
        elsif d == five
          "5"
        elsif d == six
          "6"
        elsif d == seven
          "7"
        elsif d == eight
          "8"
        elsif d == nine
          "9"
        elsif d == zero
          "0"
        end
      }.join("")
    end

    def to_i
      @output.to_i
    end
  end

  def initialize(input = File.read("data/day8.txt"))
    @outputs = input.split("\n").map { |line|
      line.split(" | ").map { |signals| signals.split(" ") }
    }.map { |signals, digits|
      Output.new(signals, digits)
    }
  end

  def solution
    @outputs.map(&:to_i).sum
  end
end
