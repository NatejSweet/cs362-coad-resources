require 'rails_helper'

RSpec.describe User, type: :model do
    let(:user) { User.new }

    it "exists" do
        expect(user).to_not be_nil
    end

    it " has an email" do
        expect(user).to respond_to(:email)
    end

    it "has an encrypted_password" do
        expect(user).to respond_to(:encrypted_password)
    end

    it "has a reset_password_token" do
        expect(user).to respond_to(:reset_password_token)
    end

    it "has a confirmation_token" do
        expect(user).to respond_to(:confirmation_token)
    end

    it "has an unconfirmed_email" do
        expect(user).to respond_to(:unconfirmed_email)
    end

    it "has a role" do
        expect(user).to respond_to(:role)   
    end

    it { should belong_to(:organization) }

end
