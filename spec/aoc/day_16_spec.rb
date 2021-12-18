require "spec_helper"

RSpec.describe "Day 16" do
  subject { described_class.new(input).solution }

  describe AoC::Day16Part1 do
    context "using the first test input" do
      let(:input) { "8A004A801A8002F478" }

      it { is_expected.to eq 16 }
    end

    context "using the second test input" do
      let(:input) { "620080001611562C8802118E34" }


      it { is_expected.to eq 12 }
    end

    context "using the third test input" do
      let(:input) { "C0015000016115A2E0802F182340" }

      it { is_expected.to eq 23 }
    end

    context "using the fourth test input" do
      let(:input) { "A0016C880162017C3686B18A3D4780" }

      it { is_expected.to eq 31 }
    end
  end

  describe AoC::Day16Part2, :skip do
    it { is_expected.to eq nil }
  end
end
