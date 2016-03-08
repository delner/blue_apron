require 'spec_helper'

describe BlueApron::Moves::Rock do
  subject { BlueApron::Moves::Rock.new }

  it { expect(subject).to be_a_kind_of(BlueApron::Move) }

  describe "#beats" do
    subject { super().beats }
    it { expect(subject).to eq(BlueApron::Moves::Scissors) }
  end
  describe "#beaten_by" do
    subject { super().beaten_by }
    it { expect(subject).to eq(BlueApron::Moves::Paper) }
  end
end