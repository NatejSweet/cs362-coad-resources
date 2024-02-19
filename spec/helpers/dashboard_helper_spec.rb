require 'rails_helper'

RSpec.describe DashboardHelper, type: :helper do
  describe 'test dashboard_for' do
    it 'should return admin_dashboard' do
      user = double('User', admin?: true, organization: nil)
      expect(helper.dashboard_for(user)).to eq('admin_dashboard')
    end

    it 'should return organization_submitted_dashboard' do
      user = double('User', admin?: false, organization: double('Organization', submitted?: true, approved?: false))
      expect(helper.dashboard_for(user)).to eq('organization_submitted_dashboard')
    end

    it 'should return organization_approved_dashboard' do
      user = double('User', admin?: false, organization: double('Organization', submitted?: false, approved?: true))
      expect(helper.dashboard_for(user)).to eq('organization_approved_dashboard')
    end

    it 'should return create_application_dashboard' do
      user = double('User', admin?: false, organization: double('Organization', submitted?: false, approved?: false))
      expect(helper.dashboard_for(user)).to eq('create_application_dashboard')
    end
  end
end
