require "spec_helper"

RSpec.describe AoC::Day1Part1 do
  describe "#solution" do
    subject { described_class.new.solution }

    it "works" do
      expect(subject).to eq 2
    end
  end
end
