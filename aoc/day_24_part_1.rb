class AoC::Day24Part1
  class Program
    def initialize(input)
      @input = input
    end

    def result
      w = 0
      x = 0
      y = 0
      z = 0

      w = input.shift # inp w
      x = x * 0 # mul x 0
      x = x + z # add x z
      x = x % 26 # mod x 26
      z = z / 1 # div z 1
      x = x + 11 # add x 11
      x = x == w ? 1 : 0 # eql x w
      x = x == 0 ? 1 : 0 # eql x 0
      y = y * 0 # mul y 0
      y = y + 25 # add y 25
      y = y * x # mul y x
      y = y + 1 # add y 1
      z = z * y # mul z y
      y = y * 0 # mul y 0
      y = y + w # add y w
      y = y + 14 # add y 14
      y = y * x # mul y x
      z = z + y # add z y
      w = input.shift # inp w
      x = x * 0 # mul x 0
      x = x + z # add x z
      x = x % 26 # mod x 26
      z = z / 1 # div z 1
      x = x + 13 # add x 13
      x = x == w ? 1 : 0 # eql x w
      x = x == 0 ? 1 : 0 # eql x 0
      y = y * 0 # mul y 0
      y = y + 25 # add y 25
      y = y * x # mul y x
      y = y + 1 # add y 1
      z = z * y # mul z y
      y = y * 0 # mul y 0
      y = y + w # add y w
      y = y + 8 # add y 8
      y = y * x # mul y x
      z = z + y # add z y
      w = input.shift # inp w
      x = x * 0 # mul x 0
      x = x + z # add x z
      x = x % 26 # mod x 26
      z = z / 1 # div z 1
      x = x + 11 # add x 11
      x = x == w ? 1 : 0 # eql x w
      x = x == 0 ? 1 : 0 # eql x 0
      y = y * 0 # mul y 0
      y = y + 25 # add y 25
      y = y * x # mul y x
      y = y + 1 # add y 1
      z = z * y # mul z y
      y = y * 0 # mul y 0
      y = y + w # add y w
      y = y + 4 # add y 4
      y = y * x # mul y x
      z = z + y # add z y
      w = input.shift # inp w
      x = x * 0 # mul x 0
      x = x + z # add x z
      x = x % 26 # mod x 26
      z = z / 1 # div z 1
      x = x + 10 # add x 10
      x = x == w ? 1 : 0 # eql x w
      x = x == 0 ? 1 : 0 # eql x 0
      y = y * 0 # mul y 0
      y = y + 25 # add y 25
      y = y * x # mul y x
      y = y + 1 # add y 1
      z = z * y # mul z y
      y = y * 0 # mul y 0
      y = y + w # add y w
      y = y + 10 # add y 10
      y = y * x # mul y x
      z = z + y # add z y
      w = input.shift # inp w
      x = x * 0 # mul x 0
      x = x + z # add x z
      x = x % 26 # mod x 26
      z = z / 26 # div z 26
      x = x + -3 # add x -3
      x = x == w ? 1 : 0 # eql x w
      x = x == 0 ? 1 : 0 # eql x 0
      y = y * 0 # mul y 0
      y = y + 25 # add y 25
      y = y * x # mul y x
      y = y + 1 # add y 1
      z = z * y # mul z y
      y = y * 0 # mul y 0
      y = y + w # add y w
      y = y + 14 # add y 14
      y = y * x # mul y x
      z = z + y # add z y
      w = input.shift # inp w
      x = x * 0 # mul x 0
      x = x + z # add x z
      x = x % 26 # mod x 26
      z = z / 26 # div z 26
      x = x + -4 # add x -4
      x = x == w ? 1 : 0 # eql x w
      x = x == 0 ? 1 : 0 # eql x 0
      y = y * 0 # mul y 0
      y = y + 25 # add y 25
      y = y * x # mul y x
      y = y + 1 # add y 1
      z = z * y # mul z y
      y = y * 0 # mul y 0
      y = y + w # add y w
      y = y + 10 # add y 10
      y = y * x # mul y x
      z = z + y # add z y
      w = input.shift # inp w
      x = x * 0 # mul x 0
      x = x + z # add x z
      x = x % 26 # mod x 26
      z = z / 1 # div z 1
      x = x + 12 # add x 12
      x = x == w ? 1 : 0 # eql x w
      x = x == 0 ? 1 : 0 # eql x 0
      y = y * 0 # mul y 0
      y = y + 25 # add y 25
      y = y * x # mul y x
      y = y + 1 # add y 1
      z = z * y # mul z y
      y = y * 0 # mul y 0
      y = y + w # add y w
      y = y + 4 # add y 4
      y = y * x # mul y x
      z = z + y # add z y
      w = input.shift # inp w
      x = x * 0 # mul x 0
      x = x + z # add x z
      x = x % 26 # mod x 26
      z = z / 26 # div z 26
      x = x + -8 # add x -8
      x = x == w ? 1 : 0 # eql x w
      x = x == 0 ? 1 : 0 # eql x 0
      y = y * 0 # mul y 0
      y = y + 25 # add y 25
      y = y * x # mul y x
      y = y + 1 # add y 1
      z = z * y # mul z y
      y = y * 0 # mul y 0
      y = y + w # add y w
      y = y + 14 # add y 14
      y = y * x # mul y x
      z = z + y # add z y
      w = input.shift # inp w
      x = x * 0 # mul x 0
      x = x + z # add x z
      x = x % 26 # mod x 26
      z = z / 26 # div z 26
      x = x + -3 # add x -3
      x = x == w ? 1 : 0 # eql x w
      x = x == 0 ? 1 : 0 # eql x 0
      y = y * 0 # mul y 0
      y = y + 25 # add y 25
      y = y * x # mul y x
      y = y + 1 # add y 1
      z = z * y # mul z y
      y = y * 0 # mul y 0
      y = y + w # add y w
      y = y + 1 # add y 1
      y = y * x # mul y x
      z = z + y # add z y
      w = input.shift # inp w
      x = x * 0 # mul x 0
      x = x + z # add x z
      x = x % 26 # mod x 26
      z = z / 26 # div z 26
      x = x + -12 # add x -12
      x = x == w ? 1 : 0 # eql x w
      x = x == 0 ? 1 : 0 # eql x 0
      y = y * 0 # mul y 0
      y = y + 25 # add y 25
      y = y * x # mul y x
      y = y + 1 # add y 1
      z = z * y # mul z y
      y = y * 0 # mul y 0
      y = y + w # add y w
      y = y + 6 # add y 6
      y = y * x # mul y x
      z = z + y # add z y
      w = input.shift # inp w
      x = x * 0 # mul x 0
      x = x + z # add x z
      x = x % 26 # mod x 26
      z = z / 1 # div z 1
      x = x + 14 # add x 14
      x = x == w ? 1 : 0 # eql x w
      x = x == 0 ? 1 : 0 # eql x 0
      y = y * 0 # mul y 0
      y = y + 25 # add y 25
      y = y * x # mul y x
      y = y + 1 # add y 1
      z = z * y # mul z y
      y = y * 0 # mul y 0
      y = y + w # add y w
      y = y + 0 # add y 0
      y = y * x # mul y x
      z = z + y # add z y
      w = input.shift # inp w
      x = x * 0 # mul x 0
      x = x + z # add x z
      x = x % 26 # mod x 26
      z = z / 26 # div z 26
      x = x + -6 # add x -6
      x = x == w ? 1 : 0 # eql x w
      x = x == 0 ? 1 : 0 # eql x 0
      y = y * 0 # mul y 0
      y = y + 25 # add y 25
      y = y * x # mul y x
      y = y + 1 # add y 1
      z = z * y # mul z y
      y = y * 0 # mul y 0
      y = y + w # add y w
      y = y + 9 # add y 9
      y = y * x # mul y x
      z = z + y # add z y
      w = input.shift # inp w
      x = x * 0 # mul x 0
      x = x + z # add x z
      x = x % 26 # mod x 26
      z = z / 1 # div z 1
      x = x + 11 # add x 11
      x = x == w ? 1 : 0 # eql x w
      x = x == 0 ? 1 : 0 # eql x 0
      y = y * 0 # mul y 0
      y = y + 25 # add y 25
      y = y * x # mul y x
      y = y + 1 # add y 1
      z = z * y # mul z y
      y = y * 0 # mul y 0
      y = y + w # add y w
      y = y + 13 # add y 13
      y = y * x # mul y x
      z = z + y # add z y
      w = input.shift # inp w
      x = x * 0 # mul x 0
      x = x + z # add x z
      x = x % 26 # mod x 26
      z = z / 26 # div z 26
      x = x + -12 # add x -12
      x = x == w ? 1 : 0 # eql x w
      x = x == 0 ? 1 : 0 # eql x 0
      y = y * 0 # mul y 0
      y = y + 25 # add y 25
      y = y * x # mul y x
      y = y + 1 # add y 1
      z = z * y # mul z y
      y = y * 0 # mul y 0
      y = y + w # add y w
      y = y + 12 # add y 12
      y = y * x # mul y x
      z = z + y # add z y

      z == 0
    end

    private

    def input
      @input
    end
  end

  def initialize(input = File.read("data/day24.txt"))
    @instructions = input.strip.split("\n").map { |line| line.split(" ") }
  end

  def solution
    <<~CODE
      w = 0
      x = 0
      y = 0
      z = 0

      #{
        @instructions.map { |instruction|
          op, a, b = *instruction

          rb =
            case op
            when "mul"
              "#{a} = #{a} * #{b}"
            when "mod"
              "#{a} = #{a} % #{b}"
            when "add"
              "#{a} = #{a} + #{b}"
            when "eql"
              "#{a} = #{a} == #{b} ? 1 : 0"
            when "div"
              "#{a} = #{a} / #{b}"
            when "inp"
              "#{a} = input.shift"
            else
              raise "unknown instruction"
            end

          [rb, "#", *instruction].join(" ")
        }.join("\n")
      }

      z == 0
    CODE
  end
end
