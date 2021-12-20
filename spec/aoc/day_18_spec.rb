require "spec_helper"

RSpec.describe "Day 18", :focus do
  subject { described_class.new(input).solution }

  let(:input) { <<~INPUT }
    [[[0,[5,8]],[[1,7],[9,6]]],[[4,[1,2]],[[1,4],2]]]
    [[[5,[2,8]],4],[5,[[9,9],0]]]
    [6,[[[6,2],[5,6]],[[7,6],[4,7]]]]
    [[[6,[0,7]],[0,9]],[4,[9,[9,0]]]]
    [[[7,[6,4]],[3,[1,3]]],[[[5,5],1],9]]
    [[6,[[7,3],[3,2]]],[[[3,8],[5,7]],4]]
    [[[[5,4],[7,7]],8],[[8,3],8]]
    [[9,3],[[9,9],[6,[4,9]]]]
    [[2,[[7,7],7]],[[5,8],[[9,3],[0,2]]]]
    [[[[5,2],5],[8,[3,7]]],[[5,[7,5]],[4,4]]]
  INPUT

  describe AoC::Day18Part1 do
    it { is_expected.to eq 4140 }
  end

  describe AoC::Day18Part2 do
    it { is_expected.to eq 3993 }
  end

  describe AoC::Day18Part1::SnailfishNumber do
    describe "homework" do
      it "computes the homework result correctly" do
        one = described_class.parse("[[[0,[4,5]],[0,0]],[[[4,5],[2,6]],[9,5]]]")
        two = described_class.parse("[7,[[[3,7],[4,3]],[[6,3],[8,8]]]]")
        three = described_class.parse("[[2,[[0,8],[3,4]]],[[[6,7],1],[7,[1,6]]]]")
        four = described_class.parse("[[[[2,4],7],[6,[0,5]]],[[[6,8],[2,8]],[[2,1],[4,5]]]]")
        five = described_class.parse("[7,[5,[[3,8],[1,4]]]]")
        six = described_class.parse("[[2,[2,2]],[8,[8,1]]]")
        seven = described_class.parse("[2,9]")
        eight = described_class.parse("[1,[[[9,3],9],[[9,0],[0,7]]]]")
        nine = described_class.parse("[[[5,[7,4]],7],1]")
        ten = described_class.parse("[[[[4,2],2],6],[8,7]]")

        sum = one + two
        expect(sum.to_a)
          .to eq [[[[4,0],[5,4]],[[7,7],[6,0]]],[[8,[7,7]],[[7,9],[5,0]]]]

        sum += three
        expect(sum.to_a)
          .to eq [[[[6,7],[6,7]],[[7,7],[0,7]]],[[[8,7],[7,7]],[[8,8],[8,0]]]]

        sum += four
        expect(sum.to_a)
          .to eq [[[[7,0],[7,7]],[[7,7],[7,8]]],[[[7,7],[8,8]],[[7,7],[8,7]]]]

        sum += five
        expect(sum.to_a)
          .to eq [[[[7,7],[7,8]],[[9,5],[8,7]]],[[[6,8],[0,8]],[[9,9],[9,0]]]]

        sum += six
        sum += seven
        sum += eight
        sum += nine
        sum += ten

        expect(sum.to_a).to eq [[[[8,7],[7,7]],[[8,6],[7,7]]],[[[0,7],[6,6]],[8,7]]]
      end

      context "homework examples" do
        subject {
          homework.map { |n| described_class.parse(n) }.inject(&:+).to_a
        }

        context "with homework example 1" do
          let(:homework) { <<~STR.strip.split("\n") }
            [1,1]
            [2,2]
            [3,3]
            [4,4]
          STR

          it { is_expected.to eq [[[[1,1],[2,2]],[3,3]],[4,4]] }
        end

        context "with homework example 2" do
          let(:homework) { <<~STR.strip.split("\n") }
            [1,1]
            [2,2]
            [3,3]
            [4,4]
            [5,5]
          STR

          it { is_expected.to eq [[[[3,0],[5,3]],[4,4]],[5,5]] }
        end

        context "with homework example 2" do
          let(:homework) { <<~STR.strip.split("\n") }
            [1,1]
            [2,2]
            [3,3]
            [4,4]
            [5,5]
            [6,6]
          STR

          it { is_expected.to eq [[[[5,0],[7,4]],[5,5]],[6,6]] }
        end
      end
    end

    describe "parsing" do
      subject { described_class.parse(str).to_a }

      let(:str) {
        "[[[[1,2],[3,4]],[[5,6],[7,8]]],9]"
      }

      it "parses stuff right" do
        expect(subject).to eq([[[[1,2],[3,4]],[[5,6],[7,8]]],9])
      end
    end

    describe "addition" do
      subject { (a + b).to_a }

      describe "adding example 1" do
        let(:a) { described_class.parse("[[[[4,3],4],4],[7,[[8,4],9]]]") }
        let(:b) { described_class.parse("[1,1]") }

        it { is_expected.to eq [[[[0,7],4],[[7,8],[6,0]]],[8,1]] }
      end

      describe "adding example 2" do
        let(:a) {
          described_class.parse(
            "[[[[6,7],[6,7]],[[7,7],[0,7]]],[[[8,7],[7,7]],[[8,8],[8,0]]]]"
          )
        }
        let(:b) {
          described_class.parse(
            "[[[[2,4],7],[6,[0,5]]],[[[6,8],[2,8]],[[2,1],[4,5]]]]"
          )
        }

        it { is_expected
          .to eq [[[[7,0],[7,7]],[[7,7],[7,8]]],[[[7,7],[8,8]],[[7,7],[8,7]]]] }
      end

      describe "adding example 3" do
        let(:a) {
          described_class.parse(
            "[[[[1,2],1],1],1]"
          )
        }
        let(:b) {
          described_class.parse(
            "[[[[1,2],1],1],1]"
          )
        }

        it { is_expected
          .to eq [[[[0,3],1],2],[[[0,3],1],1]] }
      end
    end

    describe "reducing" do
      subject { described_class.parse(str).to_a }

      context "reducing [[[[[4,3],4],4],[7,[[8,4],9]]],[1,1]]" do
        let(:str) { "[[[[[4,3],4],4],[7,[[8,4],9]]],[1,1]]" }

        it "automatically splits the number" do
          expect(subject).to eq [[[[0,7],4],[[7,8],[6,0]]],[8,1]]
        end
      end
    end

    describe "splitting" do
      subject { described_class.parse(str).to_a }

      context "splitting [[7,8],[0,13]]" do
        let(:str) { "[[7,8],[0,13]]" }

        it "automatically splits the number" do
          expect(subject).to eq [[7,8],[0,[6,7]]]
        end
      end

      context "splitting [[7,1],[10,3]]" do
        let(:str) { "[[7,1],[10,3]]" }

        it "automatically splits the number" do
          expect(subject).to eq [[7,1],[[5,5],3]]
        end
      end
    end

    describe "explosions" do
      subject { described_class.parse(str).to_a }

      context "exploding [[[[[9,8],1],2],3],4]" do
        let(:str) { "[[[[[9,8],1],2],3],4]" }

        it "automatically reduces the number" do
          expect(subject).to eq [[[[0,9],2],3],4]
        end
      end

      context "exploding [7,[6,[5,[4,[3,2]]]]]" do
        let(:str) { "[7,[6,[5,[4,[3,2]]]]]" }

        it "automatically reduces the number" do
          expect(subject).to eq [7,[6,[5,[7,0]]]]
        end
      end

      context "exploding [[6,[5,[4,[3,2]]]],1]" do
        let(:str) { "[[6,[5,[4,[3,2]]]],1]" }

        it "automatically reduces the number" do
          expect(subject).to eq [[6,[5,[7,0]]],3]
        end
      end

      context "exploding [[3,[2,[1,[7,3]]]],[6,[5,[4,[3,2]]]]]" do
        let(:str) { "[[3,[2,[1,[7,3]]]],[6,[5,[4,[3,2]]]]]" }

        it "automatically reduces the number" do
          expect(subject).to eq [[3,[2,[8,0]]],[9,[5,[7,0]]]]
        end
      end

      context "exploding [[3,[2,[8,0]]],[9,[5,[4,[3,2]]]]]" do
        let(:str) { "[[3,[2,[8,0]]],[9,[5,[4,[3,2]]]]]" }

        it "automatically reduces the number" do
          expect(subject).to eq [[3,[2,[8,0]]],[9,[5,[7,0]]]]
        end
      end
    end
  end
end
