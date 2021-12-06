require "spec_helper"

RSpec.describe AoC::Day6Part2 do
  describe "#solution" do
    subject { described_class.new(input).solution }

    let(:input) { "3,4,3,1,2" }

    it { is_expected.to eq 26984457539 }
  end
end
