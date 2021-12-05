require "./days/day_one.rb"

RSpec.describe "Day 1" do
  describe ".count_increasing" do
    let(:input) { [199, 200, 208, 210, 200, 207, 240, 269, 260, 263] }
    subject { count_increasing(input) }

    it { is_expected.to eq 7 }
  end

  describe ".count_summary_increasing" do
    let(:input) { [199, 200, 208, 210, 200, 207, 240, 269, 260, 263] }
    subject { count_summary_increasing(input) }

    it { is_expected.to eq 5 }
  end

  describe ".part_one" do
    subject { part_one }

    it { is_expected.to eq 1581 }
  end

  describe ".part_two" do
    subject { part_two }

    it { is_expected.to eq 1618 }
  end
end
