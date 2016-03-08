require 'spec_helper'

describe BlueApron::State do
  let(:state) { BlueApron::State.new }
  subject { state }

  describe "#current_turn" do
    it { expect(subject).to respond_to(:current_turn) }
    it { expect(subject).to respond_to(:current_turn=) }
  end
  describe "#turns" do
    subject { super().turns }
    context "when no turns have been applied" do
      it { expect(subject).to be_a_kind_of(Array) }
      it { expect(subject).to have(0).items }
    end
  end
  describe "#record" do
    subject { super().record }
    context "when no turns have been applied" do
      it { expect(subject).to include(win: 0, loss: 0, tie: 0) }
    end
  end
  describe "#apply_turn" do
    subject { super().apply_turn(turn, outcome) }
    let(:turn) { double('turn') }
    context "when given a win" do
      let(:outcome) { :win }
      it { subject; expect(state.record).to include(win: 1) }
      it { subject; expect(state.turns).to include(turn) }
    end
    context "when given a loss" do
      let(:outcome) { :loss }
      it { subject; expect(state.record).to include(loss: 1) }
      it { subject; expect(state.turns).to include(turn) }
    end
    context "when given a tie" do
      let(:outcome) { :tie }
      it { subject; expect(state.record).to include(tie: 1) }
      it { subject; expect(state.turns).to include(turn) }
    end
  end
end