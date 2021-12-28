require "spec_helper"

RSpec.describe "Day 17" do
  subject { described_class.new(input).solution }

  let(:input) { <<~INPUT }
    target area: x=20..30, y=-10..-5
  INPUT

  describe AoC::Day17Part1 do
    it { is_expected.to eq 45 }
  end

  describe AoC::Day17Part2 do
    it { is_expected.to eq 112 }
  end

  describe AoC::Day17Part1::Probe do
    it "moves the way we expect" do
      probe = described_class.new(x: 0, y: 0, vx: 7, vy: 2, max_y: 0)

      probe = probe.step

      expect(probe.x).to eq 7
      expect(probe.y).to eq 2
      expect(probe.vx).to eq 6
      expect(probe.vy).to eq 1

      probe = probe.step

      expect(probe.x).to eq 13
      expect(probe.y).to eq 3
      expect(probe.vx).to eq 5
      expect(probe.vy).to eq 0

      probe = probe.step

      expect(probe.x).to eq 18
      expect(probe.y).to eq 3
      expect(probe.vx).to eq 4
      expect(probe.vy).to eq(-1)

      probe = probe.step

      expect(probe.x).to eq 22
      expect(probe.y).to eq 2
      expect(probe.vx).to eq 3
      expect(probe.vy).to eq(-2)

      expect(probe.max_y).to eq 3
    end
  end
end
