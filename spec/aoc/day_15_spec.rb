require "spec_helper"

RSpec.describe "Day 15" do
  subject { described_class.new(input).solution }

  let(:input) { <<~INPUT }
    1163751742
    1381373672
    2136511328
    3694931569
    7463417111
    1319128137
    1359912421
    3125421639
    1293138521
    2311944581
  INPUT

  describe AoC::Day15Part1 do
    it { is_expected.to eq 40 }
  end

  describe AoC::Day15Part2 do
    it { is_expected.to eq 315 }
  end
end
