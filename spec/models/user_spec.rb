require 'rails_helper'

RSpec.describe User, type: :model do
    let(:user) { User.new }

    it "exists" do
        expect(user).to_not be_nil
    end

    it " has an email" do
        expect(user).to respond_to(:email)
    endgit 

    it "has a role" do
        expect(user).to respond_to(:role)   
    end

    it { should belong_to(:organization) }

    it { should validate_length_of(:email).is_at_least(1)}

    it { should validate_length_of(:email).is_at_most(255)}

    it { should validate_presence_of(:email)}
    
    it { should validate_uniqueness_of(:email)}

    it { should validate_length_of(:password).is_at_least(1)}

    it { should validate_length_of(:password).is_at_most(255)}

    #it { should expect(user.valid?).to be true }    
    
end
