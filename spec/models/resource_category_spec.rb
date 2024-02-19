require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do
  let(:resourceCategory) { build :resource_category }

  #verifiers
  it "exists" do
    expect(resourceCategory).to_not be_nil
  end

  it "has a name" do
    expect(resourceCategory).to respond_to(:name)
  end

  it "can be active" do 
    expect(resourceCategory).to respond_to(:active)
  end

  it "has organizations" do
    expect(resourceCategory).to respond_to(:organizations)
  end

  it "has tickets" do
    expect(resourceCategory).to respond_to(:tickets)
  end

  it "validates presence of name" do
    expect(resourceCategory).to validate_presence_of(:name)
  end

  it "validates at least one name" do
    expect(resourceCategory).to validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)
  end

  it "validates uniqueness of name" do
    expect(resourceCategory).to validate_uniqueness_of(:name).case_insensitive
  end
  #end of verifiers

  #has_many's
  it { should have_and_belong_to_many(:organizations) }
  it { should have_many(:tickets) }
  # end of has_many's

  # scopes
  it "responds to active with an array of active resource categories" do
    expect(ResourceCategory.active).to eq([])
  end 

  it "responds to inactive with an array of active resource categories" do
    expect(ResourceCategory.inactive).to eq([])
  end 
  # end of scopes

  # methods
  it "returns an instance of ResourceCategory with name 'Unspecified'" do
    resource_category = ResourceCategory.unspecified
    expect(resource_category).to be_an_instance_of(ResourceCategory)
    expect(resource_category.name).to eq("Unspecified")
  end

  it "updates the active attribute to true" do
    resourceCategory.activate
    expect(resourceCategory.active).to eq(true)
  end

  it "updates the active attribute to false" do
    resourceCategory.deactivate
    expect(resourceCategory.active).to eq(false)
  end

  it "returns true if the active attribute is false" do
    resourceCategory.active = false
    expect(resourceCategory.inactive?).to eq(true)
  end
  it "should return the name of the resource category" do
    expect(resourceCategory.to_s).to eq(resourceCategory.name)
  end
  # end of methods
end
