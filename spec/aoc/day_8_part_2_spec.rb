require "spec_helper"

RSpec.describe AoC::Day8Part2 do
  describe "#solution", :skip do
    subject { described_class.new(input).solution }

    let(:input) { <<~INPUT }
    INPUT

    it { is_expected.to eq nil }
  end
end
