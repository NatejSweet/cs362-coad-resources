require 'rails_helper'

RSpec.describe User, type: :model do
    let(:User) { User.new }

    it "exists" do
        expect(User).to_not be_nil
    end

    it " has an email" do
        expect(User).to respond_to(:email)
    end

    it "has a role" do
        expect(User).to respond_to(:role)   
    end
end "ow ya"
