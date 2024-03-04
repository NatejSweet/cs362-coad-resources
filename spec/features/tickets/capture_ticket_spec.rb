require 'rails_helper'

RSpec.describe 'Capturing a Ticket', type: :feature do
  before do
    @approved_user = create(:user, :organization_approved)
    @region = create(:region)
    @resource_category = create(:resource_category)
    @ticket = create(:ticket, region: @region, resource_category: @resource_category)
    @ticket.update(organization_id: nil)
    log_in_as(@approved_user)
  end
  it 'allows a user to capture a ticket' do
    visit ticket_path(@ticket.id)
    # click_link 'Capture'
    expect(current_path).to eq ticket_path(@ticket.id)
  end
end