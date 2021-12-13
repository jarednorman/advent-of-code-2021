require "spec_helper"

RSpec.describe "Day 12" do
  subject { described_class.new(input).solution }

  let(:input) { <<~INPUT }
    start-A
    start-b
    A-c
    A-b
    b-d
    A-end
    b-end
  INPUT

  describe AoC::Day12Part1 do
    it { is_expected.to eq 10 }
  end

  describe AoC::Day12Part2 do
    it { is_expected.to eq 36 }
  end
end
