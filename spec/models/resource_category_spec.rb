require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do
    let(:ResourceCategory) { ResourceCategory.new }

    it "exists" do
        expect(ResourceCategory).to_not be_nil
    end

    it "has a name" do
        expect(ResourceCategory).to respond_to(:name)
    end
    it "can be active" do 
        expect(ResourceCategory).to respond_to(:active)
    end
    it "has organizations" do
        expect(ResourceCategory).to respond_to(:organizations)
    end
    it "has tickets" do
        expect(ResourceCategory).to respond_to(:tickets)
    end
    
    

end
