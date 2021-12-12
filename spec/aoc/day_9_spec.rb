require "spec_helper"

RSpec.describe "Day 9" do
  let(:input) { <<~INPUT }
    2199943210
    3987894921
    9856789892
    8767896789
    9899965678
  INPUT

  describe "Part 1" do
    subject { AoC::Day9Part1.new(input).solution }

    it { is_expected.to eq 15 }
  end

  describe "Part 2" do
    subject { AoC::Day9Part2.new(input).solution }

    it { is_expected.to eq 1134 }
  end
end
