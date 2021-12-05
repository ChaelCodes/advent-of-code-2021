require "./days/day_two.rb"

RSpec.describe "Day 2" do
  describe ".advanced_move" do
    subject { advanced_move(position, direction) }
    let(:position) { { horizontal: 0, depth: 0, aim: 0 } }
    let(:direction) { "forward 10" }

    it { is_expected.to eq({ horizontal: 10, depth: 0, aim: 0 }) }

    context "when direction is down" do
      let(:direction) { "down 5" }

      it { is_expected.to eq({ horizontal: 0, depth: 0, aim: 5 }) }
    end

    context "when direction is up" do
      let(:direction) { "up 17" }

      it { is_expected.to eq({ horizontal: 0, depth: 0, aim: -17 }) }
    end

    context "when direction is nil" do
      let(:direction) { "" }

      it { is_expected.to eq({ horizontal: 0, depth: 0, aim: 0 }) }
    end
  end

  describe ".position" do
    subject { position(input, move_function) }
    let(:input) { ["forward 5", "down 5", "forward 8", "up 3", "down 8", "forward 2"]}
    let(:move_function) { :move }

    it { is_expected.to eq({ aim: 0, horizontal: 15, depth: 10 }) }

    context "when part two" do
      let(:move_function) { :advanced_move }

      it { is_expected.to eq({ aim: 10, horizontal: 15, depth: 60 }) }
    end
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

  describe ".part_two" do
    subject { part_two }

    it { is_expected.to eq(2138382217) }
  end
end
