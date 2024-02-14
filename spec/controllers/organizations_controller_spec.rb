require 'rails_helper'

RSpec.describe OrganizationsController, type: :controller do
    describe "while logged in as user" do
        let(:user) { create(:user) }
        let (:organization) { create(:organization) }
        before(:each) { sign_in user }
        it "should get index successfully " do 
          get(:index)
          expect(response).to be_successful 
        end
        it "should get new successfully " do
            get(:new)
            expect(response).to be_successful 
            end
        it "should create new organization successfully " do
            
            post(:create, params: {organization: organization.attributes})
            expect(response).to be_successful
        end
        it "should not get edit successfully " do
            
            get(:edit, params: {id: organization.id})
            expect(response).not_to be_successful 
        end
        it "should not update organization successfully " do
            
            put(:update, params: {id: organization.id, organization: organization.attributes})
            expect(response).to redirect_to(dashboard_path)
        end
        it "should show organization successfully " do
            
            get(:show, params: {id: organization.id})
            expect(response).not_to be_successful
        end
        it "should approve organization successfully " do
            
            put(:approve, params: {id: organization.id})
            expect(response).to redirect_to(dashboard_path)
        end
        it 'should not reject organization successfully' do
            put :reject, params: { id: organization.id, organization: { rejection_reason: "Test Rejection Reason" } }
            expect(response).to redirect_to(dashboard_path)
  end


    end

    describe "while not logged in" do
        let(:organization) { create(:organization) }
        it "should redirect GET #index to the login page" do
            get(:index)
            expect(response).to redirect_to(new_user_session_path) 
        end
        it "should redirect GET #new to the login page" do
            get(:new)
            expect(response).to redirect_to(new_user_session_path) 
        end
        it "should redirect POST #create to the login page" do           
            post(:create, params: {organization: organization.attributes})
            expect(response).to redirect_to(new_user_session_path)
        end
        it "should redirect GET #edit to the login page" do           
            get(:edit, params: {id: organization.id})
            expect(response).to redirect_to(new_user_session_path) 
        end
        it "should redirect PUT #update to the login page" do           
            put(:update, params: {id: organization.id, organization: organization.attributes})
            expect(response).to redirect_to(new_user_session_path)
        end
        it "should redirect GET #show to the login page" do           
            get(:show, params: {id: organization.id})
            expect(response).to redirect_to(new_user_session_path)
        end
        it "should redirect PUT #approve to the login page" do             
            put(:approve, params: {id: organization.id})
            expect(response).to redirect_to(new_user_session_path)
        end
        it "should redirect PUT #reject to the login page" do
            put(:reject, params: {id: organization.id, organization: {rejection_reason: "Test Rejection Reason"}})
            expect(response).to redirect_to(new_user_session_path)
        end
    end
    describe "while logged in as an organization" do
        let(:user) { create(:user, :organization_approved) }
        let(:organization) {create(:organization) }
        before(:each) { sign_in user }
        it "should get #index successfully" do 
            get(:index)
            expect(response).to be_successful 
        end

        it "should not get #new successfully" do
            get(:new)
            expect(response).not_to be_successful 
        end

        it "should not create new organization successfully" do
            post(:create, params: { organization: organization.attributes })
            expect(response).to redirect_to(dashboard_path)
        end

        it "should get #edit successfully" do
            get(:edit, params: { id: organization.id })
            expect(response).to be_successful 
        end

        it "should update organization successfully" do
            put(:update, params: { id: organization.id, organization:  organization.attributes })
            expect(response).to redirect_to(organization_path(id: organization.id))
        end

        it "should show organization successfully" do
            get(:show, params: { id: organization.id })
            expect(response).to be_successful
        end

        it "should not approve organization successfully" do
            put(:approve, params: { id: organization.id })
            expect(response).to redirect_to(dashboard_path)
        end

        it "should not reject organization successfully" do
            put(:reject, params: { id: organization.id, organization: { rejection_reason: "Test Rejection Reason" } })
            expect(response).to redirect_to(dashboard_path)
        end
    end

    describe "while logged in as an rejected organization" do
        let(:user) { create(:user, :organization_rejected) }
        let(:organization) { create(:organization) }
        before(:each) { sign_in user }
        it "should get #index successfully" do 
            get(:index)
            expect(response).to be_successful 
        end
        it "should not get #new successfully" do
            get(:new)
            expect(response).not_to be_successful 
        end
        it "should not create new organization successfully" do
            post(:create, params: { organization: organization.attributes })
            expect(response).to redirect_to(dashboard_path)
        end
        it "should not get #edit successfully" do
            get(:edit, params: { id: organization.id })
            expect(response).not_to be_successful 
        end
        it "should not update organization successfully" do
            put(:update, params: { id: organization.id, organization: organization} )
            expect(response).to redirect_to(dashboard_path)
        end
        it "should not show organization successfully" do
            get(:show, params: { id: organization.id })
            expect(response).not_to be_successful
        end
        it "should not approve organization successfully" do
            put(:approve, params: { id: organization.id })
            expect(response).to redirect_to(dashboard_path)
        end
        it "should not reject organization successfully" do
            put(:reject, params: { id: organization.id, organization: { rejection_reason: "Test Rejection Reason" } })
            expect(response).to redirect_to(dashboard_path)
        end
    end

     describe "while logged in as an admin" do
        let(:user) { create(:user, :admin) }
        let(:organization) {create(:organization)}
        before(:each) { sign_in user }
        it "should GET #index successfuly" do 
          get(:index)
          expect(response).to be_successful
        end
        it "should GET #new successfuly" do
            get(:new)
            expect(response).to redirect_to(dashboard_path) 
        end
        it "should create new organization successfuly " do
            post(:create, params: {organization: organization.attributes})
            expect(response).to redirect_to(dashboard_path)
        end
        it "should GET #edit successfuly" do
            organization = create(:organization)
            get(:edit, params: {id: organization.id})
            expect(response).to redirect_to(dashboard_path)
        end
        it "should not update organization successfuly " do
            organization = create(:organization)
            put(:update, params: {id: organization.id, organization: organization.attributes})
            expect(response).to redirect_to(dashboard_path)
        end
        it "should show organization successfuly " do
            organization = create(:organization)
            get(:show, params: {id: organization.id})
            expect(response).to be_successful
        end
        it "should approve organization successfuly " do
            organization = create(:organization)
            put(:approve, params: {id: organization.id})
            expect(response).to redirect_to(organizations_path)
        end
        it "should reject organization successfuly " do
            organization = create(:organization)
            put(:reject, params: {id: organization.id, organization: {rejection_reason: "Test Rejection Reason"}})
            expect(response).to redirect_to(organizations_path)
        end
    end


end
