require "spec_helper"

RSpec.describe AoC::Day1Part2 do
  describe "#solution" do
    subject { described_class.new(input: test_input).solution }

    let(:test_input) {
      <<~INPUT
        199
        200
        208
        210
        200
        207
        240
        269
        260
        263
      INPUT
    }

    it "works" do
      expect(subject).to eq 5
    end
  end
end
