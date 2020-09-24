require 'rails_helper'

RSpec.describe Admin::TracksController, type: :controller do 
	render_views

	let(:page) { Capybara::Node::Simple.new(response.body) } 
	let(:user) { FactoryBot.create :user, :admin }
	let(:valid_attributes) do 
		FactoryBot.attributes_for :track
	end
	let(:invalid_attributes) do 
		{ name: "" }
	end
	let!(:track) { FactoryBot.create :track }

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
  			expect(page).to have_content(track.name)
  		end

  	end

  	describe "GET edit" do 
  		before do 
  			get :edit, params: { id: track.id }
  		end

  		it "should return http success" do 
  			expect(response).to have_http_status(:success)
  		end

  		it "should render form's elements" do 
  			expect(page).to have_field('Track Name', with: track.name)
  		end
  	end

  	describe "PUT update" do 
  		context "with valid params" do 
  			before do 
  				put :update, params: { id: track.id, track: valid_attributes }
  			end

  			it "should assign the track" do 
  				expect(assigns(:track)).to eq(track)
  			end 

  			it "should update the track" do 
  				track.reload
  				expect(track.name).to eq(valid_attributes[:name])
  			end

  			it "should redirect after update" do 
  				expect(response).to redirect_to(admin_track_path(track))
  			end
  		end

  		context "with invalid params" do 

  			it "should return http success" do 
  				put :update, params: { id: track.id, track: invalid_attributes }
  				expect(response).to have_http_status(:success)
  			end

  			it "should not change track" do 
  				expect do 
  					put :update, params: { id: track.id, track: invalid_attributes }
  				end.not_to change { track.reload.name }
  			end

  		end
  	end

  	describe "GET show" do 
  		before do 
  			get :show, params: { id: track.id }
  		end

  		it "should return http success" do 
  			expect(response).to have_http_status(:success)
  		end

  		it "should render form's elements" do 
  			expect(page).to have_content(track.name)
  			expect(page).to have_content(track.simulator_id)
  		end

  	end

  	describe "DELETE destroy" do 

  		it "should destroy the track" do 
  			expect {
  				delete :destroy, params: { id: track.id }
  			}.to change(Track, :count).by(-1)
  		end

  		it "should redirects to the field" do
	      delete :destroy, params: { id: track.id }
	      expect(response).to redirect_to(admin_tracks_path)
	    end

  	end

end