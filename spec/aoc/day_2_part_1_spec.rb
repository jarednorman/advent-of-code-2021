require "spec_helper"

RSpec.describe AoC::Day2Part1 do
  describe "#solution" do
    subject { described_class.new(test_input).solution }

    let(:test_input) {
      <<~TEXT
        forward 5
        down 5
        forward 8
        up 3
        down 8
        forward 2
      TEXT
    }

    it { is_expected.to eq 150 }
  end
end
