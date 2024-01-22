require 'rails_helper'

RSpec.describe User, type: :model do
    let(:user) { User.new }

    it "exists" do
        expect(user).to_not be_nil
    end

    it " has an email" do
        expect(user).to respond_to(:email)
    end

    it "has a role" do
        expect(user).to respond_to(:role)   
    end

    it { should belong_to(:organization) }

end
