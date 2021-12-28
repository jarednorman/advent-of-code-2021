class AoC::Day24Part1
  def solution
    model_numbers.peach_with_index.select { |number, i|
      puts i if i % 100000 == 0
      valid? number
    }.pmap { |number| number.first.join('').to_i }.max
  end

  private

  def model_numbers
    nums = 9.downto(1)
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

    w = input.shift
    x = z % 26 + 11
    x = x == w ? 0 : 1
    y = 25 * x + 1
    z = z * y
    y = (w + 14) * x
    z = z + y

    w = input.shift
    x = z % 26 + 13
    x = x == w ? 0 : 1
    y = 25 * x + 1
    z = z * y
    y = (w + 8) * x
    z = z + y

    w = input.shift
    x = z % 26 + 11
    x = x == w ? 0 : 1
    y = 25 * x + 1
    z = z * y
    y = (w + 4) * x
    z = z + y

    w = input.shift
    x = z % 26 + 10
    x = x == w ? 0 : 1
    y = 25 * x + 1
    z = z * y
    y = (w + 10) * x
    z = z + y

    w = input.shift
    x = -3 == w ? 0 : 1
    y = 25 * x + 1
    z = z * y
    y = (w + 14) * x
    z = z + y

    w = input.shift
    x = -4 == w ? 0 : 1
    y = 25 * x + 1
    z = z * y
    y = (w + 10) * x
    z = z + y

    w = input.shift
    x = z % 26 + 12
    x = x == w ? 0 : 1
    y = 25 * x + 1
    z = z * y
    y = (w + 4) * x
    z = z + y

    w = input.shift
    x = -8 == w ? 0 : 1
    y = 25 * x + 1
    z = z * y
    y = (w + 14) * x
    z = z + y

    w = input.shift
    x = -3 == w ? 0 : 1
    y = 25 * x + 1
    z = z * y
    y = (w + 1) * x
    z = z + y

    w = input.shift
    x = -12 == w ? 0 : 1
    y = 25 * x + 1
    z = z * y
    y = (w + 6) * x
    z = z + y

    w = input.shift
    x = (z % 26) + 14
    x = x == w ? 0 : 1
    y = 25 * x + 1
    z = z * y
    y = (w + 0) * x
    z = z + y

    w = input.shift
    x = -6 == w ? 0 : 1
    y = 25 * x + 1
    z = z * y
    y = (w + 9) * x
    z = z + y

    w = input.shift
    x = z % 26 + 11
    x = x == w ? 0 : 1
    y = 25 * x + 1
    z = z * y
    y = (w + 13) * x
    z = z + y

    w = input.shift
    x = -12 == w ? 0 : 1
    y = 25 * x + 1
    z = z * y
    y = (w + 12) * x
    z = z + y

    z == 0
  end
end
