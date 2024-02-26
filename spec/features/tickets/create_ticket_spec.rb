require 'rails_helper'

RSpec.describe 'Creating a Ticket', type: :feature do

    before do
        @region = create(:region)
        @resource_category = create(:resource_category)
    end

    it 'can be created from the home screen' do
        visit root_path
        click_on 'Get Help'
        fill_in 'Full Name', with: 'Brandon Example'
        fill_in 'Phone Number', with: '555-111-2345'

        select @region.name, from: 'Region'
        select @resource_category.name, from: 'Resource Category'
        
        fill_in 'Description', with: 'Test Description'

        click_on 'Send this help request'

        expect(current_path).to eq ticket_submitted_path
    end

end
