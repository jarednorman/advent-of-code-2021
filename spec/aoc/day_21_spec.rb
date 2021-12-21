require "spec_helper"

RSpec.describe "Day 21" do
  subject { described_class.new(input).solution }

  let(:input) { <<~INPUT }
    Player 1 starting position: 4
    Player 2 starting position: 8
  INPUT

  describe AoC::Day21Part1, :skip do
    it { is_expected.to eq 739785 }
  end

  describe AoC::Day21Part2, :focus do
    it { is_expected.to eq 444_356_092_776_315 }
  end
end
