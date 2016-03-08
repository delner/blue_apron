require 'spec_helper'

describe BlueApron::Strategies do
  let(:strategies_module) { BlueApron::Strategies }
  subject { strategies_module }

  describe "#add" do
    subject { super().add(name, strategy) }
    before(:each) { subject }

    context "given a name and strategy" do
      let(:name) { "test" }
      let(:strategy) { double('stategy') }
      it { expect(strategies_module.all).to include(name => strategy) }
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
    context "given a name that matches a strategy" do
      let(:name) { "test" }
      let(:strategy) { double('strategy') }
      before(:each) { strategies_module.add(name, strategy) }
      it { expect(subject).to eq(strategy) }
    end
  end
end