require "spec_helper"

RSpec.describe "Day 23" do
  subject { described_class.new(input).solution }

  let(:input) { <<~INPUT }
    #############
    #...........#
    ###B#C#B#D###
      #A#D#C#A#
      #########
  INPUT

  describe AoC::Day23Part1, :focus do
    it { is_expected.to eq 12521 }
  end

  describe AoC::Day23Part2, :skip do
    it { is_expected.to eq nil }
  end
end
