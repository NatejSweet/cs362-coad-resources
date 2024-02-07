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
    
#belongs_to's
    it {should belong_to(:region)} 
    it {should belong_to(:resource_category)} 
    it {should belong_to(:organization)} 
#end of belongs_to's

#validations   
    it "validates at least one name" do
        expect(ticket).to validate_length_of(:name).is_at_least(1)
    end

    it "validates at most 1020 descriptions" do
      expect(ticket).to validate_length_of(:description).is_at_most(1020)
    end

    describe "validates phone numbers" do
      it {should allow_value("+1-555-555-1212").for(:phone)} 
      it { should_not allow_value("popcorn").for(:phone)}
    end

    it "validates phone using phony_plausible " do
      expect(Ticket.validators_on(:phone)).to include(PhonyPlausibleValidator)
    end
#end of validations

#scopes
    it "responds to open with true" do
        expect(ticket.open?).to be_truthy
    end

    it "responds to captured with true" do     
      expect(ticket.captured?).to_not be_truthy
    end
    it "responds to Ticket.closed with an array of closed tickets" do
        expect(Ticket.closed).to eq([])
    end

    it "responds to all_organization with an array of all organization tickets that are open" do
        expect(Ticket.all_organization).to eq([]) and expect(Ticket.all_organization).to_not eq(nil)
    end
    
    it "responds to organization with an array of organization tickets that are open and have a valid organization id" do
      expect(Ticket.organization(1)).to eq([]) and expect(Ticket.organization(1)).to_not eq(nil)
    end

    it "responds to closed_organization with an array of organization tickets that are closed and have a valid organization id" do
      expect(Ticket.closed_organization(1)).to eq([]) and expect(Ticket.closed_organization(1)).to_not eq(nil)
    end

    it "responds to region with an array of tickets that have a valid region id" do
      expect(Ticket.region(1)).to eq([]) and expect(Ticket.region(1)).to_not eq(nil)
    end

    it "responds to resource_category with an array of tickets that have a valid resource category id" do
      expect(Ticket.resource_category(1)).to eq([]) and expect(Ticket.resource_category(1)).to_not eq(nil)
    end
#end of scopes

  end