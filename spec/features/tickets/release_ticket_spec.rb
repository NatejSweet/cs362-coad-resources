require 'rails_helper'

RSpec.describe 'Releasing a ticket', type: :feature do
before do
    @user = create(:user, :organization_approved)
    @region = create(:region)
    @resource_category = create(:resource_category)
    @ticket = create(:ticket, region: @region, resource_category: @resource_category) 
    log_in_as(@user)
  end
  it 'releases a ticket' do
    visit ticket_path(@ticket.id)
    click_link 'Release'
    expect(current_path).to eq dashboard_path
  end
end
