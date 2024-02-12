require 'rails_helper'

RSpec.describe DashboardController, type: :controller do
    describe "GET #index while logged in" do
        let(:user) { create(:user) }
        before(:each) { sign_in user }
        it "should be successful" do 
          get(:index)
          expect(response).to be_successful 
        end
    end

    describe "GET #index while not logged in" do
        it "should redirect to the login page" do
            get(:index)
            expect(response).to redirect_to(new_user_session_path) 
        end
    end

    describe "GET #index while logged in as an admin" do
        let(:user) { create(:user, :admin) }
        before(:each) { sign_in user }
        it "should be succesul" do 
          get(:index)
          expect(response).to be_successful 
        end
    end

    describe "GET #index while logged in as an organization" do
        let(:user) { create(:user, :organization_approved) }
        before(:each) { sign_in user }
        it "should be successful" do 
          get(:index)
          expect(response).to be_successful 
        end
    end

    describe "GET #index while logged in as an rejected organization" do
        let(:user) { create(:user, :organization_rejected) }
        before(:each) { sign_in user }
        it "should be successful" do 
          get(:index)
          expect(response).to be_successful 
        end
    end

end