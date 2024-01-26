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

  it 'validates presence of name' do
    expect(region).to validate_presence_of(:name)
  end

  it 'validates length of name is at least 1 but not more than 255' do
    expect(region).to validate_length_of(:name).is_at_least(1).is_at_most(255)
  end

  it 'validates uniqueness of name' do
    expect(region).to validate_uniqueness_of(:name).case_insensitive
  end

  it 'responts to to_s with name' do
    expect(region.to_s).to eq(region.name)
  end

  it 'responds to self.uspecified with a region with the name of "unspecified"' do
    expect(Region.unspecified).to be_an_instance_of(Region).and have_attributes(name: "Unspecified")
  end

end