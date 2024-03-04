require 'rails_helper'

RSpec.describe 'User registration', type: :feature do


    describe "When registering as a new user" do

        it 'registers a new user' do

            visit new_user_registration_path
        
            fill_in 'Email', with: 'test@example.com'
            fill_in 'Password', with: 'password'
            fill_in 'Password confirmation', with: 'password'
        
            click_button 'Sign up'
        
            expect(page).to have_current_path(root_path)
        end
    end

end

