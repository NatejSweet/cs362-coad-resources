require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
    describe 'full_title' do
        it 'returns the base title' do
            expect(full_title).to eq('Disaster Resource Network')
        end

        it 'returns the page title and the base title' do
            expect(full_title('Help')).to eq('Help | Disaster Resource Network')
        end
    end

end
