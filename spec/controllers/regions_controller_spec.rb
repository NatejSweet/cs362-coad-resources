require 'rails_helper'

RSpec.describe RegionsController, type: :controller do


    describe "while logged in as user" do
        let (:user) { create(:user) }
        let (:region) { create(:region) }
        before(:each) { sign_in user }
        it "should not get index successfully " do
            get(:index)
            expect(response).to redirect_to(dashboard_path)
        end
        it "should not get show successfully " do
            get(:show, params: {id: region.id})
            expect(response).to redirect_to(dashboard_path)
        end
        it "should not get new successfully " do
            get(:new)
            expect(response).to redirect_to(dashboard_path)
        end
        it "should not create new region successfully " do
            post(:create, params: {region: region.attributes})
            expect(response).to redirect_to(dashboard_path)
        end
        it "should not get edit successfully " do
            get(:edit, params: {id: region.id})
            expect(response).to redirect_to(dashboard_path)
        end
        it "should not update region successfully " do
            put(:update, params: {id: region.id, region: region.attributes})
            expect(response).to redirect_to(dashboard_path)
        end
        it "should not destroy region successfully " do
            delete(:destroy, params: {id: region.id})
            expect(response).to redirect_to(dashboard_path)
        end
    end

    describe "while logged in as admin" do
        let (:admin) { create(:user, role: :admin) }
        let (:region) { create(:region) }
        before(:each) { sign_in admin }
        it "should get index successfully " do
            get(:index)
            expect(response).to be_successful
        end
        it "should get show successfully " do
            get(:show, params: {id: region.id})
            expect(response).to be_successful
        end
        it "should get new successfully " do
            get(:new)
            expect(response).to be_successful
        end
        it "should create new region successfully " do
            post(:create, params: {region: region.attributes})
            expect(response).to be_successful
        end
        it "should get edit successfully " do
            get(:edit, params: {id: region.id})
            expect(response).to be_successful
        end
        it "should update region successfully " do
            put(:update, params: {id: region.id, region: region.attributes})
            expect(response).to redirect_to(region_path(id: region.id))
        end
        it "should destroy region successfully " do
            delete(:destroy, params: {id: region.id})
            expect(response).to redirect_to(regions_path)
        end
    end

    describe "while logged in as an approved organization" do
        let (:user) { create(:user, :organization_approved) }
        let (:region) { create(:region) }
        before(:each) { sign_in user }
        it "should not get index successfully " do
            get(:index)
            expect(response).to redirect_to(dashboard_path)
        end
        it "should not get show successfully " do
            get(:show, params: {id: region.id})
            expect(response).to redirect_to(dashboard_path)
        end
        it "should not get new successfully " do
            get(:new)
            expect(response).to redirect_to(dashboard_path)
        end
        it "should not create new region successfully " do
            post(:create, params: {region: region.attributes})
            expect(response).to redirect_to(dashboard_path)
        end
        it "should not get edit successfully " do
            get(:edit, params: {id: region.id})
            expect(response).to redirect_to(dashboard_path)
        end
        it "should not update region successfully " do
            put(:update, params: {id: region.id, region: region.attributes})
            expect(response).to redirect_to(dashboard_path)
        end
        it "should not destroy region successfully " do
            delete(:destroy, params: {id: region.id})
            expect(response).to redirect_to(dashboard_path)
        end
    end

    describe "while logged in as an rejected organization" do
        let (:user) { create(:user, :organization_rejected) }
        let (:region) { create(:region) }
        before(:each) { sign_in user }
        it "should not get index successfully " do
            get(:index)
            expect(response).to redirect_to(dashboard_path)
        end
        it "should not get show successfully " do
            get(:show, params: {id: region.id})
            expect(response).to redirect_to(dashboard_path)
        end
        it "should not get new successfully " do
            get(:new)
            expect(response).to redirect_to(dashboard_path)
        end
        it "should not create new region successfully " do
            post(:create, params: {region: region.attributes})
            expect(response).to redirect_to(dashboard_path)
        end
        it "should not get edit successfully " do
            get(:edit, params: {id: region.id})
            expect(response).to redirect_to(dashboard_path)
        end
        it "should not update region successfully " do
            put(:update, params: {id: region.id, region: region.attributes})
            expect(response).to redirect_to(dashboard_path)
        end
        it "should not destroy region successfully " do
            delete(:destroy, params: {id: region.id})
            expect(response).to redirect_to(dashboard_path)
        end
    end

    describe "while not logged in" do
        it "should not get index successfully " do
            get(:index)
            expect(response).to redirect_to(new_user_session_path)
        end
        it "should not get show successfully " do
            get(:show, params: {id: 1})
            expect(response).to redirect_to(new_user_session_path)
        end
        it "should not get new successfully " do
            get(:new)
            expect(response).to redirect_to(new_user_session_path)
        end
        it "should not create new region successfully " do
            post(:create, params: {region: attributes_for(:region)})
            expect(response).to redirect_to(new_user_session_path)
        end
        it "should not get edit successfully " do
            get(:edit, params: {id: 1})
            expect(response).to redirect_to(new_user_session_path)
        end
        it "should not update region successfully " do
            put(:update, params: {id: 1, region: attributes_for(:region)})
            expect(response).to redirect_to(new_user_session_path)
        end
        it "should not destroy region successfully " do
            delete(:destroy, params: {id: 1})
            expect(response).to redirect_to(new_user_session_path)
        end
    end

end
