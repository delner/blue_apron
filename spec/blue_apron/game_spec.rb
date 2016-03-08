require 'spec_helper'

describe BlueApron::Game do
  subject { BlueApron::Game.new }
  describe "#play" do
    it { expect(subject).to respond_to(:play) }
  end
end