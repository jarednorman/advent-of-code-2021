require "spec_helper"

RSpec.describe "Day 11" do
  subject { described_class.new(input).solution }

  let(:input) { <<~INPUT }
    5483143223
    2745854711
    5264556173
    6141336146
    6357385478
    4167524645
    2176841721
    6882881134
    4846848554
    5283751526
  INPUT

  describe AoC::Day11Part1 do
    it { is_expected.to eq 1656 }
  end

  describe AoC::Day11Part2, :skip do
    it { is_expected.to eq nil }
  end
end
