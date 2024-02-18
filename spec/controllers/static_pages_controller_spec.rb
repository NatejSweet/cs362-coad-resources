require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  describe "GET #index" do
    it "should be successful" do 
      get(:index)
      expect(response).to be_successful 
    end
  end
end
