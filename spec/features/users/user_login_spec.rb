require 'rails_helper'

RSpec.describe 'Logging in', type: :feature do

    let(:user) { create(:user) }

    it 'logs in as user' do
      visit login_path
  
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
  
      click_link 'Log in'
 
    end
end
