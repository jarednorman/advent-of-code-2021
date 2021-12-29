require "spec_helper"

RSpec.describe "Day 25" do
  subject { described_class.new(input).solution }

  let(:input) { <<~INPUT }
    v...>>.vv>
    .vv>>.vv..
    >>.>v>...v
    >>v>>.>.v.
    v>v.vv.v..
    >.>>..v...
    .vv..>.>v.
    v.v..>>v.v
    ....v..v.>
  INPUT

  describe AoC::Day25Part1, :focus do
    it { is_expected.to eq 58 }
  end

  describe AoC::Day25Part2, :skip do
    it { is_expected.to eq nil }
  end
end
