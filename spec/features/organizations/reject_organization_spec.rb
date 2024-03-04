require 'rails_helper'

RSpec.describe 'Rejecting an organization', type: :feature do
    let (:admin) {create(:user, :admin)}
    let (:organization) {create(:organization)}
    before do
        log_in_as(admin)
    end
    it 'rejects an organization' do
        visit organization_path(organization.id)
    fill_in 'Rejection Reason', with: 'This is a test rejection.'
    click_button 'Reject'
    expect(page).to have_content('rejected')
    end

end
