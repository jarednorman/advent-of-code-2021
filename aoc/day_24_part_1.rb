class AoC::Day24Part1
  def solution
    model_numbers.each_with_index.select { |number, i|
      puts i if i % 10000 == 0
      valid? number
    }.map(&:first).max.join('')
  end

  private

  def model_numbers
    nums = (1..9)
    Enumerator.new do |y|
      nums.each { |a|
        nums.each { |b|
          nums.each { |c|
            nums.each { |d|
              nums.each { |e|
                nums.each { |f|
                  nums.each { |g|
                    nums.each { |h|
                      nums.each { |i|
                        nums.each { |j|
                          nums.each { |k|
                            nums.each { |l|
                              nums.each { |m|
                                nums.each { |n|
                                  y << [
                                    a, b, c, e, f,
                                    g, h, i, j, k,
                                    l, m, n, n
                                  ]
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    end
  end

  def valid?(input)
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
end
