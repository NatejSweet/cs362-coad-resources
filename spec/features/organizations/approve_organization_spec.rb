require 'rails_helper'

RSpec.describe 'Approving an organization', type: :feature do
    before do 
        @admin = create(:user, :admin)
        @organization = create(:organization)
        log_in_as(@admin)
    end
    it 'approves an organization' do
        visit organization_path(@organization.id)
        click_link 'Approve'
        expect(page).to have_content('approved')
    end

end
