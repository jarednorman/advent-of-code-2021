class AoC::Day18Part1
  class Node < Struct.new(:parent, :left, :right, keyword_init: true)
    def number_pair?
      [left, right].all? { |n| n.is_a?(Integer) }
    end
  end

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
      @tree = reduce(tree)
    end

    def tree
      @tree
    end

    def to_a(node = @tree)
      return node if node.is_a?(Integer)

      [
        to_a(node.left),
        to_a(node.right)
      ]
    end

    def +(other)
      node = Node.new(
        left: tree,
        right: other.tree
      )

      node.left.parent = node unless node.left.is_a?(Integer)
      node.right.parent = node unless node.right.is_a?(Integer)

      self.class.new(node)
    end

    def magnitude
      # FIXME
      0
    end

    private

    def reduce(tree)
      loop do
        if explodable?(tree)
          explode(tree, 0)
          next
        elsif splittable?(tree)
          split(tree)
          next
        end

        return tree
      end
    end

    def explodable?(node)
      nested_four_deep?(node.left, 1) || nested_four_deep?(node.right, 1)
    end

    def nested_four_deep?(node, depth)
      if node.is_a?(Integer)
        false
      elsif depth >= 4 && node.left.is_a?(Integer) && node.right.is_a?(Integer)
        true
      else
        nested_four_deep?(node.left, depth + 1) ||
          nested_four_deep?(node.right, depth + 1)
      end
    end

    def explode(node, depth)
      return if node.is_a?(Integer)

      if node.number_pair? && depth >= 4
        # 1. left value goes left
        last = node
        current = node.parent

        until current.left != last
          last = current
          current = current.parent
          break if current.nil?
        end

        if current
          if current.left.is_a?(Integer)
            current.left += node.left
          else
            current = current.left

            loop do
              break if current.right.is_a?(Integer)
              current = current.right
            end

            current.right += node.left
          end
        end

        # 2. right value goes right
        last = node
        current = node.parent

        until current.right != last
          last = current
          current = current.parent
          break if current.nil?
        end

        if current
          if current.right.is_a?(Integer)
            current.right += node.right
          else
            current = current.right

            loop do
              break if current.left.is_a?(Integer)
              current = current.left
            end

            current.left += node.right
          end
        end

        # 3. pair is replaced with 0
        if node.parent.left == node
          node.parent.left = 0
        else
          node.parent.right = 0
        end
      end

      explode(node.left, depth + 1) ||
        explode(node.right, depth + 1)
    end

    def splittable?(node)
      return node >= 10 if node.is_a?(Integer)

      splittable?(node.left) || splittable?(node.right)
    end

    def split(node)
      return false if node.is_a?(Integer)

      current = node

      if current.left.is_a?(Integer) && current.left >= 10
        current.left = Node.new(
          parent: current,
          left: (current.left / 2.0).floor,
          right: (current.left / 2.0).ceil,
        )
        return true
      elsif current.right.is_a?(Integer) && current.right >= 10
        current.right = Node.new(
          parent: current,
          left: (current.right / 2.0).floor,
          right: (current.right / 2.0).ceil,
        )
        return true
      end

      split(node.left) || split(node.right)
    end
  end

  def initialize(input = File.read("data/day18.txt"))
    @numbers = input.strip.split("\n").map { |str|
      SnailfishNumber.parse(str)
    }
  end

  def solution
    @numbers.inject(&:+).magnitude
  end
end
