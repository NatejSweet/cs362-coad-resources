require 'rails_helper'

RSpec.describe 'Creating an Organization Application', type: :feature do
    before do
        @user = create(:user, )
        @admin = create(:user, :admin)
        log_in_as(@user)
    end
    it 'creates an organization application' do
        visit new_organization_path

    fill_in 'What is your name? (Last, First)', with: 'Doe, John'
    fill_in 'Organization Name', with: 'Test Organization'
    fill_in 'What is your title? (if applicable)', with: 'CEO'
    fill_in 'What is your direct phone number? Cell phone is best.', with: '123-456-7890'
    fill_in 'Who may we contact regarding your organization\'s application if we are unable to reach you?', with: 'Jane Doe'
    fill_in 'What is a good secondary phone number we may reach your organization at?', with: '098-765-4321'
    fill_in 'What is your Organization\'s email?', with: 'test@gmail.com'
    fill_in 'Description', with: 'This is a test description.'
    click_button 'Apply'

    expect(page).to have_content('Application Submitted')
 
    end


end
