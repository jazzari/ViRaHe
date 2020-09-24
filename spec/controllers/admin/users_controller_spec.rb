require 'rails_helper'

RSpec.describe Admin::UsersController, type: :controller do 
	render_views

	let(:page) { Capybara::Node::Simple.new(response.body) } 
	let(:user) { FactoryBot.create :user, :admin }
	let(:valid_attributes) do 
		FactoryBot.attributes_for :user
	end
	let(:invalid_attributes) do 
		{ name: "" }
	end

	before(:each) do
		log_in(user)
	end

  	describe "GET index" do 
  		before(:each) do 
  			get :index
  		end

  		it "should return http success" do 
  			expect(response).to have_http_status(:success)
  		end

  		it "should render the expected columns" do 
  			expect(page).to have_content(user.name)
  			expect(page).to have_content(user.email)
  		end

  	end
end
