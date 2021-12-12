require "spec_helper"

RSpec.describe "Day 10" do
  subject { described_class.new(input).solution }

  let(:input) { <<~INPUT }
    [({(<(())[]>[[{[]{<()<>>
    [(()[<>])]({[<{<<[]>>(
    {([(<{}[<>[]}>{[]{[(<()>
    (((({<>}<{<{<>}{[]{[]{}
    [[<[([]))<([[{}[[()]]]
    [{[{({}]{}}([{[{{{}}([]
    {<[[]]>}<{[{[{[]{()[[[]
    [<(<(<(<{}))><([]([]()
    <{([([[(<>()){}]>(<<{{
    <{([{{}}[<[[[<>{}]]]>[]]
  INPUT

  describe AoC::Day10Part1 do
    it { is_expected.to eq 26397 }
  end

  describe AoC::Day10Part2, :skip do
    it { is_expected.to eq nil }
  end

  describe AoC::Day10Part1::Line do
    subject { described_class.new(chars) }

    context "erroneous }" do
      let(:chars) { <<~CHARS.split('') }
        {([(<{}[<>[]}>{[]{[(<()>
      CHARS

      it { is_expected.to be_corrupted }

      its(:syntax_error_score) { is_expected.to eq 1197 }
    end

    context "erroneous )" do
      let(:chars) { <<~CHARS.split('') }
        [<(<(<(<{}))><([]([]()
      CHARS

      it { is_expected.to be_corrupted }

      its(:syntax_error_score) { is_expected.to eq 3 }
    end
  end
end
