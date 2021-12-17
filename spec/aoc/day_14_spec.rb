require "spec_helper"

RSpec.describe "Day 14" do
  subject { described_class.new(input).solution }

  let(:input) { <<~INPUT }
    NNCB

    CH -> B
    HH -> N
    CB -> H
    NH -> C
    HB -> C
    HC -> B
    HN -> C
    NN -> C
    BH -> H
    NC -> B
    NB -> B
    BN -> B
    BB -> N
    BC -> B
    CC -> N
    CN -> C
  INPUT

  describe AoC::Day14Part1 do
    it { is_expected.to eq 1588 }
  end

  describe AoC::Day14Part2, :skip do
    it { is_expected.to eq nil }
  end
end
