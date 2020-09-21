require 'rails_helper'

RSpec.describe OmniauthController do 
	before do
		request.env["devise.mapping"] = Devise.mappings[:user] # If using Devise
  		request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook] 
	end

	it "should be valid" do 
		expect(response).to be_success
	end

end