require 'rails_helper'

RSpec.describe User, type: :model do
    let(:User) { User.new }

    it "exists" do
        expect(User).to_not be_nil
    end

    it " has an email" do
        expect(User).to respond_to(:email)
    end

    it "has an encrypted password" do
        expect(User).to respond_to(:encrypted_password)
    end

    it "has a reset password token" do
        expect(User).to respond_to(:reset_password_token)
    end

    it "has a reset_password_send_at" do
        expect(User).to respond_to(:reset_password_send_at)
    end

    it "has a remember created at" do
        expect(User).to respond_to(:remember_created_at)
    end

    it "has a confirmation token" do
        expect(User).to respond_to(:confirmation_token)
    end

    it "has confirmed at" do
        expect(User).to respond_to(:confirmed_at)
    end

    it "has confirmation sent at" do
        expect(User).to respond_to(:confirmation_sent_at)
    end

    it "has an unconfirmed email" do
        expect(User).to respond_to(:unconfirmed_email);
    end

    it "has a role" do
        expect(User).to respond_to(:role)   
    end

    it "has an organization id" do
        expect(User).to respond_to(:organization_id)
    end
end
