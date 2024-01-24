require 'rails_helper'

RSpec.describe Region, type: :model do
  let(:region) { Region.new }

  it "exists" do
    expect(region).to_not be_nil
  end

  it "has a name" do
    expect(region).to respond_to(:name)
  end


  it "has tickets" do
    expect(region).to respond_to(:tickets)
  end

  it { should have_many(:tickets) }

  it "returns an instance of Region with name 'Unspecified'" do
    region = Region.unspecified
    expect(region).to be_an_instance_of(Region)
    expect(region.name).to eq("Unspecified")
  end
end