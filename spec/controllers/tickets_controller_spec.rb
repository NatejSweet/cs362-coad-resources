require 'rails_helper'

RSpec.describe TicketsController, type: :controller do

    
    describe "while logged in as admin" do
        let(:user) { create(:user, :admin) }
        let(:region) { create(:region) }
        let(:resource_category) { create(:resource_category) }
        let(:ticket) { create(:ticket, region: region, resource_category: resource_category) }
        before(:each) { sign_in user }

        it "should get new successfully " do
            get(:new)
            expect(response).to be_successful 
        end

        
        it "creates a new ticket and redirects to ticket_submitted_path" do
            post(:create, params: {ticket: ticket.attributes})
            expect(response).to redirect_to(ticket_submitted_path)
        end


        it "GET show" do
            get(:show, params: {id: ticket.id})
            expect(response).to be_successful
        end

        it "POST capture" do
            post(:capture, params: {id: ticket.id})
            expect(response).to redirect_to(dashboard_path)
        end

        it "POST release" do
            post(:release, params: {id: ticket.id})
            expect(response).to redirect_to(dashboard_path)
        end
        

        it "PATCH close (successful ticket.close())" do
            patch(:close, params: {ticket: ticket.attributes, id: ticket.id})
            expect(response).to redirect_to(dashboard_path << '#tickets:open')
        end

        # it "PATCH close (unsuccessful ticket.close())" do
        it "DELETE destroy" do
            delete(:destroy, params: {ticket: ticket.attributes, id: ticket.id})
            expect(response).to redirect_to(dashboard_path << '#tickets')
        end

    end
      describe "while logged in as approved organization" do
        let(:user) { create(:user, :organization_approved) }
        let(:region) { create(:region) }
        let(:resource_category) { create(:resource_category) }
        let(:ticket) { create(:ticket, region: region, resource_category: resource_category) }
        before(:each) { sign_in user }

        it "should get new successfully " do
            get(:new)
            expect(response).to be_successful 
        end

        
        it "creates a new ticket and redirects to ticket_submitted_path" do
            post(:create, params: {ticket: ticket.attributes})
            expect(response).to redirect_to(ticket_submitted_path)
        end

        it "GET show" do
            get(:show, params: {id: ticket.id})
            expect(response).to be_successful
        end

        it "POST capture" do
            post(:capture, params: {id: ticket.id})
            expect(response).to be_successful
        end

        it "POST release" do
            post(:release, params: {id: ticket.id})
            expect(response).to redirect_to(dashboard_path << '#tickets:organization')
        end

        it "PATCH close" do
            patch(:close, params: {ticket: ticket.attributes, id: ticket.id})
            expect(response).to redirect_to(dashboard_path << '#tickets:organization')
        end

        it "DELETE destroy" do
            delete(:destroy, params: {ticket: ticket.attributes, id: ticket.id})
            expect(response).to redirect_to(dashboard_path)
        end
      end

    describe "while logged in as rejected organization" do
        let (:user) { create(:user, :organization_rejected) }
        let (:region) { create(:region) }
        let (:resource_category) { create(:resource_category) }
        let (:ticket) { create(:ticket, region: region, resource_category: resource_category) }
        before(:each) { sign_in user }
        it "should get new successfully " do
            get(:new)
            expect(response).to be_successful
        end
        it "should create new ticket successfully " do
            post(:create, params: {ticket: ticket.attributes})
            expect(response).to redirect_to(ticket_submitted_path)
        end
        it "should not get show successfully " do
            get(:show, params: {id: ticket.id})
            expect(response).to redirect_to(dashboard_path)
        end
        it "should not post capture successfully " do
            post(:capture, params: {id: ticket.id})
            expect(response).to redirect_to(dashboard_path)
        end
        it "should not post release successfully " do
            post(:release, params: {id: ticket.id})
            expect(response).to redirect_to(dashboard_path)
        end
        it "should not patch close successfully " do
            patch(:close, params: {ticket: ticket.attributes, id: ticket.id})
            expect(response).to redirect_to(dashboard_path)
        end
        it "should not delete ticket successfully " do
            delete(:destroy, params: {ticket: ticket.attributes, id: ticket.id})
            expect(response).to redirect_to(dashboard_path)
        end
    end

    describe "while logged in as user" do
        let (:user) { create(:user) }
        let (:region) { create(:region) }
        let (:resource_category) { create(:resource_category) }
        let (:ticket) { create(:ticket, region: region, resource_category: resource_category) }
        before(:each) { sign_in user }
        it "should  get new successfully " do
            get(:new)
            expect(response).to be_successful
        end
        it "should not create new ticket successfully " do
            post(:create, params: {ticket: ticket.attributes})
            expect(response).to redirect_to(ticket_submitted_path)
        end
        it "should not get show successfully " do
            get(:show, params: {id: ticket.id})
            expect(response).to redirect_to(dashboard_path)
        end
        it "should not post capture successfully " do
            post(:capture, params: {id: ticket.id})
            expect(response).to redirect_to(dashboard_path)
        end
        it "should not post release successfully " do
            post(:release, params: {id: ticket.id})
            expect(response).to redirect_to(dashboard_path)
        end
        it "should not patch close successfully " do
            patch(:close, params: {ticket: ticket.attributes, id: ticket.id})
            expect(response).to redirect_to(dashboard_path)
        end
        it "should not delete ticket successfully " do
            delete(:destroy, params: {ticket: ticket.attributes, id: ticket.id})
            expect(response).to redirect_to(dashboard_path)
        end
    end
        
end
