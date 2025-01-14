require 'rails_helper'

RSpec.describe ResourceCategoriesController, type: :controller do
describe "while logged in as user" do
  let(:user) { create(:user) }
  let (:resource_category) { create(:resource_category) }
  before(:each) { sign_in user }
  it "should not get index successfully " do 
    get(:index)
    expect(response).not_to be_successful 
  end
  it "should not get new successfully " do
      get(:new)
      expect(response).not_to be_successful 
      end
  it "should not create new resource_category successfully " do
      
      post(:create, params: {resource_category: resource_category.attributes})
      expect(response).not_to be_successful
  end
  it "should not get edit successfully " do
      
      get(:edit, params: {id: resource_category.id})
      expect(response).not_to be_successful 
  end
  it "should redirect #update to dashboard " do
      
      put(:update, params: {id: resource_category.id, resource_category: resource_category.attributes})
      expect(response).to redirect_to((dashboard_path))
  end
  it "should not show resource_category successfully " do
      
      get(:show, params: {id: resource_category.id})
      expect(response).not_to be_successful
  end
  it "Should redirect #destroy to dashboard" do
      
      delete(:destroy, params: {id: resource_category.id})
      expect(response).to redirect_to(dashboard_path)
  end
  it "should redirect #activate to the dashboard " do
        
      put(:activate, params: {id: resource_category.id})
      expect(response).to redirect_to(dashboard_path)
  end
  it "should redirect #deactivate to the dashboard" do
          
    put(:deactivate, params: {id: resource_category.id})
    expect(response).to redirect_to(dashboard_path)
  end
  end
  
  describe "while not logged in" do
    let(:resource_category) { create(:resource_category) }
    it "should redirect GET #index to the login page" do
        get(:index)
        expect(response).to redirect_to(new_user_session_path) 
    end
    it "should redirect GET #new to the login page" do
        get(:new)
        expect(response).to redirect_to(new_user_session_path) 
    end
    it "should redirect POST #create to the login page" do           
        post(:create, params: {resource_category: resource_category.attributes})
        expect(response).to redirect_to(new_user_session_path) 
    end
    it "should redirect GET #edit to the login page" do
        get(:edit, params: {id: resource_category.id})
        expect(response).to redirect_to(new_user_session_path) 
    end
    it "should redirect PUT #update to the login page" do
        put(:update, params: {id: resource_category.id, resource_category: resource_category.attributes})
        expect(response).to redirect_to(new_user_session_path) 
    end
    it "should redirect GET #show to the login page" do
        get(:show, params: {id: resource_category.id})
        expect(response).to redirect_to(new_user_session_path) 
    end
    it "should redirect DELETE #destroy to the login page" do
        delete(:destroy, params: {id: resource_category.id})
        expect(response).to redirect_to(new_user_session_path) 
    end
    it "should redirect PUT #activate to the login page" do
        put(:activate, params: {id: resource_category.id})
        expect(response).to redirect_to(new_user_session_path) 
    end
    it "should redirect PUT #deactivate to the login page" do
        put(:deactivate, params: {id: resource_category.id})
        expect(response).to redirect_to(new_user_session_path) 
    end
  end

  describe "while logged in as admin" do
    let(:user) { create(:user, :admin) }
    let (:resource_category) { create(:resource_category) }
    before(:each) { sign_in user }
    it "should get index successfully " do 
      get(:index)
      expect(response).to be_successful 
    end
    it "should get new successfully " do
        get(:new)
        expect(response).to be_successful 
        end
    it "should create new resource_category successfully " do
        
        post(:create, params: {resource_category: resource_category.attributes})
        expect(response).to be_successful
    end
    it "should get edit successfully " do
        
        get(:edit, params: {id: resource_category.id})
        expect(response).to be_successful 
    end
    it "should update resource_category successfully " do
        
        put(:update, params: {id: resource_category.id, resource_category: resource_category.attributes})
        expect(response).to redirect_to(resource_category)
    end
    it "should show resource_category successfully " do
        
        get(:show, params: {id: resource_category.id})
        expect(response).to be_successful
    end
    it "should destroy resource_category successfully " do
        
        delete(:destroy, params: {id: resource_category.id})
        expect(response).to redirect_to(resource_categories_path)
    end
    it "should activate resource_category successfully " do
          
        put(:activate, params: {id: resource_category.id})
        expect(response).to redirect_to(resource_category)
    end
    it "should deactivate resource_category successfully " do
            
      put(:deactivate, params: {id: resource_category.id})
      expect(response).to redirect_to(resource_category)
    end
  end

    describe "while logged in as an approved organization" do
        let (:user) { create(:user, :organization_approved) }
        let (:resource_category) { create(:resource_category) }
        before(:each) { sign_in user }
        it "should not get index successfully " do
            get(:index)
            expect(response).not_to be_successful
        end
        it "should not get new successfully " do
            get(:new)
            expect(response).not_to be_successful
        end
        it "should not create new resource_category successfully " do
            post(:create, params: {resource_category: resource_category.attributes})
            expect(response).not_to be_successful
        end
        it "should not get edit successfully " do
            get(:edit, params: {id: resource_category.id})
            expect(response).not_to be_successful
        end
        it "should not update resource_category successfully " do
            put(:update, params: {id: resource_category.id, resource_category: resource_category.attributes})
            expect(response).not_to be_successful
        end
        it "should not show resource_category successfully " do
            get(:show, params: {id: resource_category.id})
            expect(response).not_to be_successful
        end
        it "should not destroy resource_category successfully " do
            delete(:destroy, params: {id: resource_category.id})
            expect(response).not_to be_successful
        end
        it "should not activate resource_category successfully " do
            put(:activate, params: {id: resource_category.id})
            expect(response).not_to be_successful
        end
        it "should not deactivate resource_category successfully " do
            put(:deactivate, params: {id: resource_category.id})
            expect(response).not_to be_successful
        end
    end

    describe "while logged in as a rejected organization" do
        let (:user) { create(:user, :organization_rejected) }
        let (:resource_category) { create(:resource_category) }
        before(:each) { sign_in user }
        it "should not get index successfully " do
            get(:index)
            expect(response).not_to be_successful
        end
        it "should not get new successfully " do
            get(:new)
            expect(response).not_to be_successful
        end
        it "should not create new resource_category successfully " do
            post(:create, params: {resource_category: resource_category.attributes})
            expect(response).not_to be_successful
        end
        it "should not get edit successfully " do
            get(:edit, params: {id: resource_category.id})
            expect(response).not_to be_successful
        end
        it "should not update resource_category successfully " do
            put(:update, params: {id: resource_category.id, resource_category: resource_category.attributes})
            expect(response).not_to be_successful
        end
        it "should not show resource_category successfully " do
            get(:show, params: {id: resource_category.id})
            expect(response).not_to be_successful
        end
        it "should not destroy resource_category successfully " do
            delete(:destroy, params: {id: resource_category.id})
            expect(response).not_to be_successful
        end
        it "should not activate resource_category successfully " do
            put(:activate, params: {id: resource_category.id})
            expect(response).not_to be_successful
        end
        it "should not deactivate resource_category successfully " do
            put(:deactivate, params: {id: resource_category.id})
            expect(response).not_to be_successful
        end
    end
end
