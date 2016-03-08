require 'spec_helper'

describe BlueApron::Turn do
  subject { BlueApron::Turn.new }
  describe "#player_move" do
    it { expect(subject).to respond_to(:player_move) }
    it { expect(subject).to respond_to(:player_move=) }
  end
  describe "#computer_move" do
    it { expect(subject).to respond_to(:computer_move) }
    it { expect(subject).to respond_to(:computer_move=) }
  end
end