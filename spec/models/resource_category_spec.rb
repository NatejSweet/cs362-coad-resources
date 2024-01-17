require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do
    let(:ResourceCategory) { ResourceCategory.new }

    it "exists" do
        expect(ResourceCategory).to_not be_nil
    end
    

end
