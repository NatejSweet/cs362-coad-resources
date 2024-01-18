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

    it "has a status" do
        expect(Organization).to respond_to(:status)
    end

    it "has a transportation" do
        expect(Organization).to respond_to(:transportation)
    end

    it "has an email" do
        expect(Organization).to respond_to(:email)
    end

    it "has a description" do
        expect(Organization).to respond_to(:description)
    end

    it "has a name" do
        expect(Organization).to respond_to(:name)
    end

    it "has a phone" do
        expect(Organization).to respond_to(:phone)
    end

    it "has a rejection reason" do
        expect(Organization).to respond_to(:rejection_reason)
    end

    it "has liability_insurance" do
        expect(Organization).to respond_to(:liability_insurance)
    end

    it "has a primary name" do
        expect(Organization).to respond_to(:primary_name)
    end

    it "has a secondary_name" do
        expect(Organization).to respond_to(:secondary_name)
    end

    it "has a secondary phone" do
        expect(Organization).to respond_to(:secondary_phone)
    end

    it "has a title" do
        expect(Organization).to respond_to(:title)
    end

end
