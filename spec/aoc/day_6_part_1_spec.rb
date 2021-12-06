require "spec_helper"

RSpec.describe AoC::Day6Part1 do
  describe "#solution" do
    subject { described_class.new(input).solution }

    let(:input) { "3,4,3,1,2" }

    it { is_expected.to eq 5934 }
  end
end
