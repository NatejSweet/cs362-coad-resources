require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do
    let(:resourceCategory) { ResourceCategory.new }

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

        it { should have_and_belong_to_many(:organizations) }
        it { should have_many(:tickets) }

        it "returns an instance of ResourceCategory with name 'Unspecified'" do
          resource_category = ResourceCategory.unspecified
          expect(resource_category).to be_an_instance_of(ResourceCategory)
          expect(resource_category.name).to eq("Unspecified")
        end

    

end
