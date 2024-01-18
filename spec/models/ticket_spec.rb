require 'rails_helper'

RSpec.describe Ticket, type: :model do
    let(:Ticket) { Ticket.new }

    it "exists" do
        expect(Ticket).to_not be_nil
    end

    it "has name" do
        expect(Ticket).to respond_to(:name)
    end

    it "has description" do
        expect(Ticket).to respond_to(:description)
    end

    it "has phone" do
        expect(Ticket).to respond_to(:phone)
    end

    it "has organization id" do
        expect(Ticket).to respond_to(:organization_id)
    end

    it "has resource categort id" do
        expect(Ticket).to respond_to(:resource_category_id)
    end

    it "has region id" do
        expect(Ticket).to respond_to(:region_id)
    end

end
