require "./days/day_three.rb"

RSpec.describe "Day 3" do
  describe ".co2_scrubber_rating" do
    subject { co2_scrubber_rating(diagnostic_report) }
    let(:diagnostic_report) { %w[00100 11110 10110 10111 10101 01111 00111 11100 10000 11001 00010 01010] }

    it { is_expected.to eq '01010' }
  end

  describe ".gamma_rate" do
    let(:diagnostic_report) { %w[00100 11110 10110 10111 10101 01111 00111 11100 10000 11001 00010 01010] }
    subject { gamma_rate(diagnostic_report) }

    it { is_expected.to eq '10110' }
  end

  describe ".most_common_for" do
    subject { most_common_for(diagnostic_report, position) }
    let(:diagnostic_report) { %w[00100 11110 10110 10111 10101 01111 00111 11100 10000 11001 00010 01010] }
    let(:position) { 0 }

    it { is_expected.to eq '1' }

    context "when equal number of records" do
      let(:diagnostic_report) {["11110", "10110", "10111", "10101", "11100", "11001"]}
      let(:position) { 1 }

      it { is_expected.to eq '1' }
    end
  end

  describe ".epsilon_rate" do
    let(:gamma_rate) { '10110' }
    subject { epsilon_rate(gamma_rate) }

    it { is_expected.to eq '01001' }
  end

  describe ".oxygen_generator_rating" do
    subject { oxygen_generator_rating(diagnostic_report) }
    let(:diagnostic_report) { %w[00100 11110 10110 10111 10101 01111 00111 11100 10000 11001 00010 01010] }

    it { is_expected.to eq '10111' }
  end

  describe ".part_one" do
    subject { part_one }
    it { is_expected.to eq 2972336 }
  end

  describe ".part_two" do
    subject { part_two }
    it { is_expected.to eq 3368358 }
  end
end
