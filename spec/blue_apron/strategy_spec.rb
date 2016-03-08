require 'spec_helper'

describe BlueApron::Strategy do
  let(:strategy) { BlueApron::Strategy.new }
  subject { strategy }

  describe "#next_move" do
    subject { strategy.next_move(state) }
    let(:state) { BlueApron::State.new }

    context "when the state is empty (first turn)" do
      # It isn't expecting any kind of particular move.
      it { expect(subject).to be_a_kind_of(BlueApron::Move) }
    end
  end
end