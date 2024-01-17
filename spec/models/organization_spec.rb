require 'rails_helper'

RSpec.describe Organization, type: :model do
    let(:Organization) { Organization.new }

    it "exists" do
        expect(Organization).to_not be_nil
    end

    it "has users" do
        expect(Organization).to respond_to(:users)
    end

    it "has tickets" do
        expect(Organization).to respond_to(:tickets)
    end

    it "has resource categories" do
        expect(Organization).to respond_to(:resource_categories)
    end
    
end
