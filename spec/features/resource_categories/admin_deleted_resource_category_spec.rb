require 'rails_helper'

RSpec.describe 'Deleting a Resource Category', type: :feature do

  before do
    @admin = create(:user, role: :admin)
    @resource_category = create(:resource_category)
    log_in_as(@admin)
  end

  it 'Admin can delete a resource category' do
    visit resource_category_path(@resource_category)

    expect(page).to have_content(@resource_category.name)

    click_link 'Delete'

    expect(page).to have_content('Category Test Resource Category was deleted.')

    expect(ResourceCategory.exists?(@resource_category.id)).to be_falsey
  end
end