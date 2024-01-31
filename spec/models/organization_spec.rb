require 'rails_helper'

RSpec.describe Organization, type: :model do
    FactoryBot.define do
  factory :organization do
    name { 'Test Organization' }
    email { 'test@email.com' }
    phone { '541-111-1111' }
    primary_name { 'test primary name' }
    secondary_name { 'test secondary name' }
    secondary_phone { '541-222-2222' }
  end
end
    let(:organization) { build(:organization) }

    it "exists" do
        expect(organization).to_not be_nil
    end

    it "has users" do
        expect(organization).to respond_to(:users)
    end

    it "has tickets" do
        expect(organization).to respond_to(:tickets)
    end

    it "has resource categories" do
        expect(organization).to respond_to(:resource_categories)
    end

    it "has a status" do
        expect(organization).to respond_to(:status)
    end

    it "has a transportation" do
        expect(organization).to respond_to(:transportation)
    end

    it "has an email" do
        expect(organization).to respond_to(:email)
    end

    it "has a description" do
        expect(organization).to respond_to(:description)
    end

    it "has a name" do
        expect(organization).to respond_to(:name)
    end

    it "has a phone" do
        expect(organization).to respond_to(:phone)
    end

    it "has a rejection reason" do
        expect(organization).to respond_to(:rejection_reason)
    end

    it "has liability_insurance" do
        expect(organization).to respond_to(:liability_insurance)
    end

    it "has a primary name" do
        expect(organization).to respond_to(:primary_name)
    end

    it "has a secondary_name" do
        expect(organization).to respond_to(:secondary_name)
    end

    it "has a secondary phone" do
        expect(organization).to respond_to(:secondary_phone)
    end

    it "has a title" do
        expect(organization).to respond_to(:title)
    end

    it { should have_many(:users) }
    it {should have_many(:tickets) }

    it { should have_and_belong_to_many(:resource_categories) }

    it 'validates the the presence of email' do
        expect(organization).to validate_presence_of(:email)
    end

    it 'validates the the presence of name' do
        expect(organization).to validate_presence_of(:name)
    end

    it 'validates the the presence of phone' do
        expect(organization).to validate_presence_of(:phone)
    end

    it 'validates the the presence of status' do
        expect(organization).to validate_presence_of(:status)
    end

    it 'validates the the presence of primary_name' do
        expect(organization).to validate_presence_of(:primary_name)
    end

    it 'validates the the presence of secondary_name' do
        expect(organization).to validate_presence_of(:secondary_name)
    end

    it 'validates the the presence of secondary_phone' do
        expect(organization).to validate_presence_of(:secondary_phone)
    end
    
    it 'validates the length of email is at least 1 but not more than 255' do
        expect(organization).to validate_length_of(:email).is_at_least(1).is_at_most(255)
    end

    it 'validates the format of email' do
     expect(organization).to allow_value("test@email.com").for(:email)
     expect(organization).to_not allow_value("testemail.com").for(:email)
    end

    it 'validates the uniqueness of email' do
        expect(organization).to validate_uniqueness_of(:email).case_insensitive
    end

    it 'validates the length of name is at least 1 but not more than 255' do
        expect(organization).to validate_length_of(:name).is_at_least(1).is_at_most(255)
    end

    it 'validates the uniqueness of name' do
        expect(organization).to validate_uniqueness_of(:name).case_insensitive
    end

    it 'validates the length of description is at most 1020' do
        expect(organization).to validate_length_of(:description).is_at_most(1020)
    end

    it 'responds to approve' do
        expect(organization.approve).to eq(:approved)
    end

    it 'responds to reject' do
        expect(organization.reject).to eq(:rejected)
    end

    it 'sets default status if status not set' do
        organization.status = nil
        expect(organization.set_default_status).to eq(:submitted)
    end

    it 'does not set default status if status is set' do
        organization.status = :approved
        expect(organization.set_default_status).to eq("approved")
    end

    it 'responds to to_s' do
        expect(organization.to_s).to eq(organization.name)
    end





end


