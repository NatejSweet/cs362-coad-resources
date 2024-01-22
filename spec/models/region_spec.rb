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

end
