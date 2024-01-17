require 'rails_helper'

RSpec.describe Ticket, type: :model do
    let(:Ticket) { Ticket.new }

    it "exists" do
        expect(Ticket).to_not be_nil
    end

end
