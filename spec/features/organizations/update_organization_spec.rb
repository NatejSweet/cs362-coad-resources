require 'rails_helper'

RSpec.describe 'Updating an Organization', type: :feature do
    let (:approved_user) {create(:user, :organization_approved)}
    let (:organization) {create(:organization)}
    before do
        log_in_as(approved_user)
    end

    it 'updates an organization' do
        visit edit_organization_path(organization.id)
        fill_in 'Name', with: 'Test Organization, but the actual test one'
        click_button 'Update Resource'
        expect(page).to have_content('Test Organization, but the actual test one')
    end


end
