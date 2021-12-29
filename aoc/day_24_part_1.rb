class AoC::Day24Part1
  PARAMS = [
    {a: 1,  b: 11,  c: 14},
    {a: 1,  b: 13,  c: 8},
    {a: 1,  b: 11,  c: 4},
    {a: 1,  b: 10,  c: 10},
    {a: 26, b: -3,  c: 14},
    {a: 26, b: -4,  c: 10},
    {a: 1,  b: 12,  c: 4},
    {a: 26, b: -8,  c: 14},
    {a: 26, b: -3,  c: 1},
    {a: 26, b: -12, c: 6},
    {a: 1,  b: 14,  c: 0},
    {a: 26, b: -6,  c: 9},
    {a: 1,  b: 11,  c: 13},
    {a: 26, b: -12, c: 12}
  ]

  BUDGET = 14.times.map { |i|
    PARAMS[i, 14].map { |param| param[:a] }.inject(:*)
  }

  def digits
    9.downto(1)
  end

  def solution
    @tested = 0
    highest_valid(z: 0, index: 0)
  end

  private

  def highest_valid(z:, index:, model_number: [])
    if z >= BUDGET[index]
      return
    end

    if index != 13
      digits.each { |d|
        new_z = compute_z(digit: d, z: z, index: index)

        if (result = highest_valid(z: new_z, index: index + 1, model_number: [*model_number, d]))
          return result
        end
      }
      nil
    else
      if (d = digits.find { |d| compute_z(digit: d, z: z, index: index) == 0 })
        [*model_number, d].join('')
      end
    end
  end

  # a is what we divide z by
  # b is what we add to x
  # c is what we add to w
  def compute_z(digit:, z:, index:)
    if index == 13
      @tested += 1

      if @tested % 1000 == 0
        puts "tested: #{@tested}"
      end
    end

    a = PARAMS[index][:a]
    b = PARAMS[index][:b]
    c = PARAMS[index][:c]

    if z % 26 + b == digit
      z / a
    else
      z / a * 26 + digit + c
    end
  end
end
