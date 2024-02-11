require 'rails_helper'

RSpec.describe User, type: :model do
    FactoryBot.define do
        factory :user do
            role { :admin }
            email { 'test@email.com' } 
            password {'testpassword'}       
        end
    end

    let(:user) { build(:user)}

    it {should define_enum_for(:role).with([:admin, :organization])}

    describe '#set_default_role' do
        it 'sets the default role to :organization' do
            user = User.new
            expect(user.role).to eq('organization')
        end
    end


    it 'has a valid admin role' do
        expect(user.role).to eq('admin')
    end

    it 'exists' do
        expect(user).to_not be_nil
    end

    it 'has a role' do
        expect(user).to respond_to(:role)   
    end

    it 'has an email' do
        expect(user).to respond_to(:email)
    end

    it 'has a password' do
        expect(user).to respond_to(:password)
    end


    it 'responds to to_s with email' do
        expect(user.to_s).to eq(user.email)
    end


    describe 'validations' do
    
        it { should belong_to(:organization) }
    
        it { should validate_presence_of(:email)}
    
        it { should validate_length_of(:email).is_at_least(1).is_at_most(255).on(:create)}
    
        it 'validates the format of email' do
            expect(user).to allow_value("test@email.com").for(:email)
            expect(user).to_not allow_value("testemail.com").for(:email)
        end
    
        it { should validate_uniqueness_of(:email).case_insensitive }
    
        it { should validate_presence_of(:password)}
    
        it { should validate_length_of(:password).is_at_least(7).is_at_most(255).on(:create)}
    end
    
end
