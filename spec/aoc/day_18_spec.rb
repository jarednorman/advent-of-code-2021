require "spec_helper"

RSpec.describe "Day 18" do
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

  describe AoC::Day18Part2, :skip do
    it { is_expected.to eq nil }
  end

  describe AoC::Day18Part1::SnailfishNumber do
    describe "parsing" do
      subject { described_class.parse(str).to_a }

      let(:str) {
        "[[[[1,2],[3,4]],[[5,6],[7,8]]],9]"
      }

      it "parses stuff right" do
        expect(subject).to eq([[[[1,2],[3,4]],[[5,6],[7,8]]],9])
      end
    end

    describe "reduction", :focus do
      subject { described_class.parse(str).to_a }

      context "reducing [[[[[9,8],1],2],3],4]" do
        let(:str) { "[[[[[9,8],1],2],3],4]" }

        it "automatically reduces the number" do
          expect(subject).to eq [[[[0,9],2],3],4]
        end
      end

      context "reducing [7,[6,[5,[4,[3,2]]]]]" do
        let(:str) { "[7,[6,[5,[4,[3,2]]]]]" }

        it "automatically reduces the number" do
          expect(subject).to eq [7,[6,[5,[7,0]]]]
        end
      end

      context "reducing [[6,[5,[4,[3,2]]]],1]" do
        let(:str) { "[[6,[5,[4,[3,2]]]],1]" }

        it "automatically reduces the number" do
          expect(subject).to eq [[6,[5,[7,0]]],3]
        end
      end

      context "reducing [[3,[2,[1,[7,3]]]],[6,[5,[4,[3,2]]]]]" do
        let(:str) { "[[3,[2,[1,[7,3]]]],[6,[5,[4,[3,2]]]]]" }

        it "automatically reduces the number" do
          expect(subject).to eq [[3,[2,[8,0]]],[9,[5,[7,0]]]]
        end
      end

      context "reducing [[3,[2,[8,0]]],[9,[5,[4,[3,2]]]]]" do
        let(:str) { "[[3,[2,[8,0]]],[9,[5,[4,[3,2]]]]]" }

        it "automatically reduces the number" do
          expect(subject).to eq [[3,[2,[8,0]]],[9,[5,[7,0]]]]
        end
      end
    end
  end
end
