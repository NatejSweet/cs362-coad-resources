require 'rails_helper'

RSpec.describe Region, type: :model do
  let(:Region) { Region.new }

  it "exists" do
    expect(Region).to_not be_nil
  end

  it "has a name" do
    expect(region).to respond_to(:name)
  end

  it "has a string representation that is its name" do
    name = 'Mt. Hood'
    Region.name = name
    result = region.to_s
  end

  it "has tickets" do
    expect(Region).to respond_to(:tickets)
  end

end
