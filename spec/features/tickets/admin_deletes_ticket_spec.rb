require 'rails_helper'

RSpec.describe 'Deleting a Ticket', type: :feature do
  before do
    @admin = create(:user, :admin)
    @region = create(:region)
    @resource_category = create(:resource_category)
    @ticket = create(:ticket, region: @region, resource_category: @resource_category) 
    log_in_as(@admin)
  end
  it 'deletes a ticket' do
    visit ticket_path(@ticket.id)
    click_link 'Delete'
    expect(page).to have_content("Ticket #{@ticket.id} was deleted")
  end
end
