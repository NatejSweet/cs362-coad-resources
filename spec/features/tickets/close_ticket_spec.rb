require 'rails_helper'

RSpec.describe 'Closing a ticket', type: :feature do
 before do
    @admin = create(:user, :admin)
    @region = create(:region)
    @resource_category = create(:resource_category)
    @ticket = create(:ticket, region: @region, resource_category: @resource_category) 
    log_in_as(@admin)
  end
  it 'closes a ticket' do
    visit ticket_path(@ticket.id)
    click_link 'Close'
    expect(current_path).to eq dashboard_path
  end
end
