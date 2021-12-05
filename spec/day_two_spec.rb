require "./days/day_two.rb"

RSpec.describe "Day 2" do
  describe ".position" do
    subject { position(input) }
    let(:input) { ["forward 5", "down 5", "forward 8", "up 3", "down 8", "forward 2"]}

    it { is_expected.to eq({ horizontal: 15, depth: 10 }) }
  end

  describe ".move" do
    subject { move(position, direction) }
    let(:position) { { horizontal: 0, depth: 0 } }
    let(:direction) { "forward 10" }

    it { is_expected.to eq({ horizontal: 10, depth: 0 }) }

    context "when direction is down" do
      let(:direction) { "down 5" }

      it { is_expected.to eq({ horizontal: 0, depth: 5 }) }
    end

    context "when direction is up" do
      let(:direction) { "up 17" }

      it { is_expected.to eq({ horizontal: 0, depth: -17 }) }
    end

    context "when direction is nil" do
      let(:direction) { "" }

      it { is_expected.to eq({ horizontal: 0, depth: 0 }) }
    end
  end

  describe ".part_one" do
    subject { part_one }

    it { is_expected.to eq(2120749) }
  end
end
