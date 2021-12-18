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

  describe AoC::Day16Part2, :focus do
    context "finding the sum of 1 and 2" do
      let(:input) { "C200B40A82" }

      it { is_expected.to eq 3 }
    end

    context "finding the product of 6 and 9" do
      let(:input) { "04005AC33890" }

      it { is_expected.to eq 54 }
    end

    context "finding the minimum of 7, 8, and 9" do
      let(:input) { "880086C3E88112" }

      it { is_expected.to eq 7 }
    end

    context "finding the maximum of 7, 8, and 9" do
      let(:input) { "CE00C43D881120" }

      it { is_expected.to eq 9 }
    end

    context "finding whether 5 is less than 15" do
      let(:input) { "D8005AC2A8F0" }

      it { is_expected.to eq 1 }
    end

    context "finding whether 5 is greater than 15" do
      let(:input) { "F600BC2D8F" }

      it { is_expected.to eq 0 }
    end

    context "finding if 5 and 15 are equal" do
      let(:input) { "9C005AC2F8F0" }

      it { is_expected.to eq 0 }
    end

    context "finding whether 1 + 3 is equal to 2 * 2" do
      let(:input) { "9C0141080250320F1802104A08" }

      it { is_expected.to eq 1 }
    end
  end
end
