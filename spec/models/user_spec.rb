require 'rails_helper'

RSpec.describe User, type: :model do
    let(:User) { User.new }

    it "exists" do
        expect(User).to_not be_nil
    end

end
