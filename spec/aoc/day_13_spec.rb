require "spec_helper"

RSpec.describe "Day 13" do
  subject { described_class.new(input).solution }

  let(:input) { <<~INPUT }
    6,10
    0,14
    9,10
    0,3
    10,4
    4,11
    6,0
    6,12
    4,1
    0,13
    10,12
    3,4
    3,0
    8,4
    1,10
    2,14
    8,10
    9,0

    fold along y=7
    fold along x=5
  INPUT

  describe AoC::Day13Part1 do
    it { is_expected.to eq 17 }
  end

  describe AoC::Day13Part2 do
  end
end
