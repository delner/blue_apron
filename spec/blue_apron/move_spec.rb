require 'spec_helper'

describe BlueApron::Move do
  let(:move_class) do
    stub_const 'TestMove', Class.new(BlueApron::Move)
    TestMove
  end
  let(:optimal_move_class) do
    stub_const 'OptimalTestMove', Class.new(BlueApron::Move)
    OptimalTestMove
  end
  let(:counter_move_class) do
    stub_const 'CounterTestMove', Class.new(BlueApron::Move)
    CounterTestMove
  end
  let(:move) { move_class.new }

  describe "#beats" do
    subject { move_class.beats optimal_move_name }
    context "when given a move to counter" do
      let(:optimal_move_name) { optimal_move_class.name.to_s }
      context "and #beats is invoked on the instance" do
        let(:move_instance) { move_class.new }
        it { subject; expect(move_instance.beats).to eq(optimal_move_class) }
      end
    end
  end
  describe "#beaten_by" do
    subject { move_class.beaten_by counter_move_name }
    context "when given a move it's countered by" do
      let(:counter_move_name) { counter_move_class.name.to_s }
      context "and #beaten_by is invoked on the instance" do
        let(:move_instance) { move_class.new }
        it { subject; expect(move_instance.beaten_by).to eq(counter_move_class) }
      end
    end
  end
  describe "#vs" do
    let(:move_instance) { move_class.new }
    subject { move_instance.vs(other_move) }
    context "when given an optimal move" do
      before(:each) { move_class.beats optimal_move_class }
      let(:other_move) { optimal_move_class.new }
      it { expect(subject).to be true }
    end
    context "when given a counter move" do
      before(:each) { move_class.beaten_by counter_move_class }
      let(:other_move) { counter_move_class.new }
      it { expect(subject).to be false }
    end
    context "when given an identical move" do
      let(:other_move) { move_class.new }
      it { expect(subject).to be_nil }
    end
  end
end