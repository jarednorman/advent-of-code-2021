require "spec_helper"

RSpec.describe AoC::Day7Part1 do
  describe "#solution" do
    subject { described_class.new(input).solution }

    let(:input) { <<~INPUT }
      16,1,2,0,4,2,7,1,2,14
    INPUT

    it { is_expected.to eq 37 }
  end
end
