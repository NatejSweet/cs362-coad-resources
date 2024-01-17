require 'rails_helper'

RSpec.describe Organization, type: :model do
    let(:Organization) { Organization.new }

    it "exists" do
        expect(Organization).to_not be_nil
    end
end
