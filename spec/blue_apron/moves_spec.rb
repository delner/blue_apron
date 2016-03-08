require 'spec_helper'

describe BlueApron::Moves do
  let(:moves_module) { BlueApron::Moves }
  subject { moves_module }

  describe "#add" do
    subject { super().add(name, move) }
    before(:each) { subject }
    after(:each) { moves_module.all.delete(name) }

    context "given a name and move" do
      let(:name) { "test" }
      let(:move) { double('move') }
      it { expect(moves_module.all).to include(name => move) }
    end
  end

  describe "#all" do
    subject { super().all }
    context "when invoked" do
      it { expect(subject).to be_a(Hash) }
    end
  end

  describe "#by_name" do
    subject { super().by_name(name) }
    context "given a name that matches a move" do
      let(:name) { "test" }
      let(:move) { double('move') }
      before(:each) { moves_module.add(name, move) }
      after(:each) { moves_module.all.delete(name) }
      it { expect(subject).to eq(move) }
    end
  end
end