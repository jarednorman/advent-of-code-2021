class AoC::Day18Part1
  Node = Struct.new(:parent, :left, :right, keyword_init: true)

  class SnailfishNumber
    def self.parse(str)
      new(to_tree(eval(str)))
    end

    def self.to_tree(arr, parent = nil)
      return arr if arr.is_a?(Integer)

      Node.new(parent: parent).tap do |node|
        node.left = to_tree(arr.first, node)
        node.right = to_tree(arr.last, node)
      end
    end

    def initialize(tree)
      @tree = tree #reduce(tree)
    end

    def to_a(node = @tree)
      return node if node.is_a?(Integer)

      [
        to_a(node.left),
        to_a(node.right)
      ]
    end

    def +(other)
      # FIXME
      self
    end

    def magnitude
      # FIXME
      0
    end

    private

    def reduce(tree)
      loop do
        if explodable?(tree)
          tree = explode(tree)
          next
        elsif splittable?(tree)
          tree = split(tree)
          next
        end

        return tree
      end
    end

    def explodable?(tree)
      tree.any? { |cell| nested_four_deep?(cell, 1) }
    end

    def nested_four_deep?(cell, depth)
      if cell.is_a?(Integer)
        false
      elsif depth == 4 && cell.is_a?(Array)
        true
      else
        cell.any? { |cell| nested_four_deep?(cell, depth + 1) }
      end
    end

    def explode(tree)
    end

    def splittable?(tree)
      false
    end
  end

  def initialize(input = File.read("data/day18.txt"))
    @numbers = input.strip.split("\n").map { |str|
      SnailfishNumber.parse(str)
    }
  end

  def solution
    @numbers.sum.magnitude
  end
end
