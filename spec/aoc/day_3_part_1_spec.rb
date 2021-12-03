require "spec_helper"

RSpec.describe AoC::Day3Part1 do
  describe "#solution" do
    subject { described_class.new(input).solution }

    let(:input) {
      <<~INPUT
        00100
        11110
        10110
        10111
        10101
        01111
        00111
        11100
        10000
        11001
        00010
        01010
      INPUT
    }

    it { is_expected.to eq 198 }
  end
end
