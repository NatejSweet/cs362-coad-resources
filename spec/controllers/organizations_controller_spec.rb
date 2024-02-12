require 'rails_helper'

RSpec.describe OrganizationsController, type: :controller do
    describe "while logged in as user" do
        let(:user) { create(:user) }
        before(:each) { sign_in user }
        it "should get index successfuly " do 
          get(:index)
          expect(response).to be_successful 
        end
        it "should get new successfuly " do
            get(:new)
            expect(response).to be_successful 
            end
        it "should create new organization successfuly " do
            post(:create, params: {organization: {name: "Test Organization", description: "Test Description", address: "Test Address", city: "Test City", state: "Test State", zip: "Test Zip", phone: "Test Phone", email: "Test Email", status: "submitted"}})
            expect(response).to be_successful
        end
        it "should not get edit successfuly " do
            organization = create(:organization)
            get(:edit, params: {id: organization.id})
            expect(response).not_to be_successful 
        end
        it "should not update organization successfuly " do
            organization = create(:organization)
            put(:update, params: {id: organization.id, organization: {name: "Test Organization", description: "Test Description", address: "Test Address", city: "Test City", state: "Test State", zip: "Test Zip", phone: "Test Phone", email: "Test Email", status: "submitted"}})
            expect(response).to redirect_to(dashboard_path)
        end
        it "should show organization successfuly " do
            organization = create(:organization)
            get(:show, params: {id: organization.id})
            expect(response).not_to be_successful
        end
        it "should approve organization successfuly " do
            organization = create(:organization)
            put(:approve, params: {id: organization.id})
            expect(response).to redirect_to(dashboard_path)
        end
        it "should reject organization successfuly " do
            organization = create(:organization)
            put(:reject, params: {id: organization.id, organization: {rejection_reason: "Test Rejection Reason"}})
            expect(response).to redirect_to(dashboard_path)
        end


    end

    # describe "while not logged in" do
    #     it "should redirect GET #index to the login page" do
    #         get(:index)
    #         expect(response).to redirect_to(new_user_session_path) 
    #     end
    #     it "should redirect GET #new to the login page" do
    #         get(:new)
    #         expect(response).to redirect_to(new_user_session_path) 
    #     end
    #     it "should redirect POST #create to the login page" do
    #         post(:create, params: {organization: {name: "Test Organization", description: "Test Description", address: "Test Address", city: "Test City", state: "Test State", zip: "Test Zip", phone: "Test Phone", email: "Test Email", status: "submitted"}})
    #         expect(response).to redirect_to(new_user_session_path)
    #     end
    #     it "should redirect GET #edit to the login page" do
    #         organization = create(:organization)
    #         get(:edit, params: {id: organization.id})
    #         expect(response).to redirect_to(new_user_session_path) 
    #     end
    #     it "should redirect PUT #update to the login page" do
    #         organization = create(:organization)
    #         put(:update, params: {id: organization.id, organization: {name: "Test Organization", description: "Test Description", address: "Test Address", city: "Test City", state: "Test State", zip: "Test Zip", phone: "Test Phone", email: "Test Email", status: "submitted"}})
    #         expect(response).to redirect_to(new_user_session_path)
    #     end
    #     it "should redirect GET #show to the login page" do
    #         organization = create(:organization)
    #         get(:show, params: {id: organization.id})
    #         expect(response).to redirect_to(new_user_session_path)
    #     end
    #     it "should redirect PUT #approve to the login page" do  
    #         organization = create(:organization)
    #         put(:approve, params: {id: organization.id})
    #         expect(response).to redirect_to(new_user_session_path)
    #     end
    #     it "should redirect PUT #reject to the login page" do
    #         organization = create(:organization)
    #         put(:reject, params: {id: organization.id, organization: {rejection_reason: "Test Rejection Reason"}})
    #         expect(response).to redirect_to(new_user_session_path)
    #     end
    # end
    # describe "while logged in as an organization" do
    #     let(:user) { create(:user, :organization_approved) }
    #     before(:each) { sign_in user }
    #     it "should get #index successfuly" do 
    #       get(:index)
    #       expect(response).to be_successful 
    #     end
    #     it "should not get #new successfuly" do
    #         get(:new)
    #         expect(response).not_to be_successful 
    #     end
    #     it "should not create new organization successfuly " do
    #         post(:create, params: {organization: {name: "Test Organization", description: "Test Description", address: "Test Address", city: "Test City", state: "Test State", zip: "Test Zip", phone: "Test Phone", email: "Test Email", status: "submitted"}})
    #         expect(response).to redirect_to(dashboard_path)
            
    #     end
    #     it "should not get #edit successfuly" do
    #         organization = create(:organization)
    #         get(:edit, params: {id: organization.id})
    #         expect(response).not_to be_successful 
    #     end
    #     it "should not update organization successfuly " do
    #         organization = create(:organization)
    #         put(:update, params: {id: organization.id, organization: {name: "Test Organization", description: "Test Description", address: "Test Address", city: "Test City", state: "Test State", zip: "Test Zip", phone: "Test Phone", email: "Test Email", status: "submitted"}})
    #         expect(response).to redirect_to(dashboard_path)
    #     end
    #     it "should show organization successfuly " do
    #         organization = create(:organization)
    #         get(:show, params: {id: organization.id})
    #         expect(response).to be_successful
    #     end
    #     it "should not approve organization successfuly " do
    #         organization = create(:organization)
    #         put(:approve, params: {id: organization.id})
    #         expect(response).to redirect_to(dashboard_path)
    #     end
    #     it "should not reject organization successfuly " do
    #         organization = create(:organization)
    #         put(:reject, params: {id: organization.id, organization: {rejection_reason: "Test Rejection Reason"}})
    #         expect(response).to redirect_to(dashboard_path)
    #     end
    # end

    # describe "while logged in as an rejected organization" do
    #     let(:user) { create(:user, :organization_rejected) }
    #     before(:each) { sign_in user }
    #     it "should get #index successfuly" do 
    #       get(:index)
    #       expect(response).to be_successful 
    #     end
    #     it "should not get #new successfuly" do
    #         get(:new)
    #         expect(response).not_to be_successful 
    #     end
    #     it "should not create new organization successfuly " do
    #         post(:create, params: {organization: {name: "Test Organization", description: "Test Description", address: "Test Address", city: "Test City", state: "Test State", zip: "Test Zip", phone: "Test Phone", email: "Test Email", status: "submitted"}})
    #         expect(response).to redirect_to(dashboard_path)
    #     end
    #     it "should not get #edit successfuly" do
    #         organization = create(:organization)
    #         get(:edit, params: {id: organization.id})
    #         expect(response).not_to be_successful 
    #     end
    #     it "should not update organization successfuly " do
    #         organization = create(:organization)
    #         put(:update, params: {id: organization.id, organization: {name: "Test Organization", description: "Test Description", address: "Test Address", city: "Test City", state: "Test State", zip: "Test Zip", phone: "Test Phone", email: "Test Email", status: "submitted"}})
    #         expect(response).to redirect_to(dashboard_path)
    #     end
    #     it "should show organization successfuly " do
    #         organization = create(:organization)
    #         get(:show, params: {id: organization.id})
    #         expect(response).to be_successful
    #     end
    #     it "should not approve organization successfuly " do
    #         organization = create(:organization)
    #         put(:approve, params: {id: organization.id})
    #         expect(response).to redirect_to(dashboard_path)
    #     end
    #     it "should not reject organization successfuly " do
    #         organization = create(:organization)
    #         put(:reject, params: {id: organization.id, organization: {rejection_reason: "Test Rejection Reason"}})
    #         expect(response).to redirect_to(dashboard_path)
    #     end
    # end

    #  describe "while logged in as an admin" do
    #     let(:user) { create(:user, :admin) }
    #     before(:each) { sign_in user }
    #     it "should GET #index successfuly" do 
    #       get(:index)
    #       expect(response).to be_successful 
    #     end
    #     it "should GET #new successfuly" do
    #         get(:new)
    #         expect(response).to be_successful 
    #     end
    #     it "should create new organization successfuly " do
    #         post(:create, params: {organization: {name: "Test Organization", description: "Test Description", address: "Test Address", city: "Test City", state: "Test State", zip: "Test Zip", phone: "Test Phone", email: "Test Email", status: "submitted"}})
    #         expect(response).to be_successful
    #     end
    #     it "should GET #edit successfuly" do
    #         organization = create(:organization)
    #         get(:edit, params: {id: organization.id})
    #         expect(response).to be_successful 
    #     end
    #     it "should update organization successfuly " do
    #         organization = create(:organization)
    #         put(:update, params: {id: organization.id, organization: {name: "Test Organization", description: "Test Description", address: "Test Address", city: "Test City", state: "Test State", zip: "Test Zip", phone: "Test Phone", email: "Test Email", status: "submitted"}})
    #         expect(response).to redirect_to(organization_path(id: organization.id))
    #     end
    #     it "should show organization successfuly " do
    #         organization = create(:organization)
    #         get(:show, params: {id: organization.id})
    #         expect(response).to be_successful
    #     end
    #     it "should approve organization successfuly " do
    #         organization = create(:organization)
    #         put(:approve, params: {id: organization.id})
    #         expect(response).to redirect_to(organizations_path)
    #     end
    #     it "should reject organization successfuly " do
    #         organization = create(:organization)
    #         put(:reject, params: {id: organization.id, organization: {rejection_reason: "Test Rejection Reason"}})
    #         expect(response).to redirect_to(organizations_path)
    #     end
    # end


end
