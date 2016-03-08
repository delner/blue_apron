require 'spec_helper'

describe BlueApron::Strategies::LastStrategy do
  let(:strategy) { BlueApron::Strategies::LastStrategy.new }
  subject { strategy }

  describe "#next_move" do
    subject { strategy.next_move(state) }
    let(:state) { BlueApron::State.new }

    context "when the state is empty (first turn)" do
      # It isn't expecting any kind of particular move.
      it { expect(subject).to be_a_kind_of(BlueApron::Move) }
    end
    context "when there is a previous move" do
      # We really should use some test move classes, but I'll just use RPS for now
      let(:previous_move) { BlueApron::Moves::Paper }
      before(:each) do
        turn = BlueApron::Turn.new
        turn.player_move = previous_move.new
        turn.computer_move = previous_move.new
        state.apply_turn(turn, :tie)
      end
      it { expect(subject).to be_a_kind_of(BlueApron::Moves::Scissors) }
    end
    context "when there are several previous moves" do
      # We really should use some test move classes, but I'll just use RPS for now
      let(:oldest_move) { BlueApron::Moves::Scissors }
      let(:newest_move) { BlueApron::Moves::Rock }
      before(:each) do
        [{ move: oldest_move, times: 1 }, { move: newest_move, times: 1}].each do |move_group|
          move_group[:times].times do
            turn = BlueApron::Turn.new
            turn.player_move = move_group[:move].new
            turn.computer_move = move_group[:move].new
            state.apply_turn(turn, :tie)
          end
        end
      end
      it { expect(subject).to be_a_kind_of(BlueApron::Moves::Paper) }
    end
  end
end