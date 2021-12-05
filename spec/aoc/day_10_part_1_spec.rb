require "spec_helper"

RSpec.describe AoC::Day10Part1 do
  describe "#solution" do
    subject { described_class.new(input).solution }

    let(:input) { <<~INPUT }
    INPUT

    it { is_expected.to eq nil }
  end
end
