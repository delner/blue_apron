require 'spec_helper'

describe BlueApron::Game do
  let(:game) { BlueApron::Game.new }
  subject { game }

  # These are really more integration tests than unit tests...
  describe "#play" do
    subject { super().play }
    let(:game) { BlueApron::Game.new(strategy: strategy, interface: interface) }
    let(:strategy) { BlueApron::Strategy.new }
    let(:interface) { BlueApron::Interfaces::Automatic.new }
    let(:player_moves) { [] }
    before(:each) { interface.moves = player_moves }

    context "using a favorite strategy" do
      let(:strategy) { BlueApron::Strategies::FavoriteStrategy.new }
      context "and given the player favors a move" do
        let(:player_moves) { ['r','r','p','s','r','p'] }
        # NOTE: Because the first move is random, the player could lose 2-3 times
        it { subject; expect(game.state.record[:loss]).to be >= 2 }
      end
    end
    context "using a last strategy" do
      let(:strategy) { BlueApron::Strategies::LastStrategy.new }
      context "and given the player repeats a move" do
        let(:player_moves) { ['r','r','r'] }
        # NOTE: Because the first move is random, the player could lose 2-3 times
        it { subject; expect(game.state.record[:loss]).to be >= 2 }
      end
    end
  end
end