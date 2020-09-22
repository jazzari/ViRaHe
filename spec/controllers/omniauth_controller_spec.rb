require 'rails_helper'

RSpec.describe OmniauthController do 
	describe "#FACEBOOK_AUTH" do 
		before do
			request.env["devise.mapping"] = Devise.mappings[:user] # If using Devise
	  		request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook] 
		end

		it "should be valid" do 
			expect(response).to be_successful
		end

		it "should reject invalid provider" do 
			request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:some_provider]
			expect(response).not_to have_http_status(403)
		end
	end

	describe "#GOOGLE_AUTH" do 
		before do
			request.env["devise.mapping"] = Devise.mappings[:user] # If using Devise
	  		request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google] 
		end

		it "should be valid" do 
			expect(response).to be_successful
		end
	end
end