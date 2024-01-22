require 'rails_helper'

RSpec.describe Ticket, type: :model do
    let(:ticket) { Ticket.new }

    it "exists" do
        expect(ticket).to_not be_nil
    end

    it "has name" do
        expect(ticket).to respond_to(:name)
    end

    it "has description" do
        expect(ticket).to respond_to(:description)
    end

    it "has phone" do
        expect(ticket).to respond_to(:phone)
    end

    it "has organization id" do
        expect(ticket).to respond_to(:organization_id)
    end

    it "has resource categort id" do
        expect(ticket).to respond_to(:resource_category_id)
    end

    it "has region id" do
        expect(ticket).to respond_to(:region_id)
    end

    it {should belong_to(:region)} 
    it {should belong_to(:resource_category)} 
    it {should belong_to(:organization)} 

end
