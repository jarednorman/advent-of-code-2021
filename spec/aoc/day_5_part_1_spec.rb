require "spec_helper"

RSpec.describe AoC::Day5Part1 do
  describe "#solution" do
    subject { described_class.new(input).solution }

    let(:input) { <<~INPUT }
      0,9 -> 5,9
      8,0 -> 0,8
      9,4 -> 3,4
      2,2 -> 2,1
      7,0 -> 7,4
      6,4 -> 2,0
      0,9 -> 2,9
      3,4 -> 1,4
      0,0 -> 8,8
      5,5 -> 8,2
    INPUT

    it { is_expected.to eq 5 }
  end
end
