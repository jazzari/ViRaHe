require 'rails_helper'

RSpec.describe Admin::SimulatorsController, type: :controller do 
	render_views

	let(:page) { Capybara::Node::Simple.new(response.body) } 
	let(:user) { FactoryBot.create :user, :admin }
	before(:each) do
		log_in(user)
	end

	let(:valid_attributes) do 
		FactoryBot.attributes_for :simulator
	end
	let(:invalid_attributes) do 
		{ name: "" }
	end
	let!(:simulator) { FactoryBot.create :simulator }



	describe "GET index" do 
  		before(:each) do 
  			get :index
  		end

  		it "should return http success" do 
  			expect(response).to have_http_status(:success)
  		end

  		it "should render the expected columns" do 
  			expect(page).to have_content(simulator.name)
  		end

  	end

  	describe "POST create" do 

  		context "with valid params" do 
  			it "should create a new simulator" do 
  				expect {
  					post :create, params: { simulator: valid_attributes }
  				}.to change(Simulator, :count).by(1)
  			end

  			it "should redirect to simulator's tracks" do 
  				post :create, params: { simulator: valid_attributes }
  				expect(response).to have_http_status(:redirect)
  				expect(response).to redirect_to admin_simulator_path(Simulator.last)
  			end

  			it "should save a new simulator in the database" do 
  				post :create, params: { simulator: valid_attributes }
  				simulator = Simulator.last
  				expect(simulator.name).to eq(valid_attributes[:name])
  			end
  		end

  		context "with invalid params" do 

  			it "should return http success with invalid params" do 
  				post :create, params: { simulator: invalid_attributes }
  				expect(response).to have_http_status(:success)
  			end

  			it "should not save the simulator in the database" do 
  				expect do 
  					post :create, params: { simulator: invalid_attributes }
  				end.not_to change(Simulator, :count)
  			end
  		end

  	end

  	describe "GET edit" do 
  		before do 
  			get :edit, params: { id: simulator.id }
  		end

  		it "should return http success" do 
  			expect(response).to have_http_status(:success)
  		end

  		it "should render form's elements" do 
  			expect(page).to have_field('Simulator Name', with: simulator.name)
  			expect(page).to have_content("Add New Track")
  			expect(page).to have_content("Add New Car")
  		end
  	end

  	describe "PUT update" do 
  		context "with valid params" do 
  			before do 
  				put :update, params: { id: simulator.id, simulator: valid_attributes }
  			end

  			it "should assign the simulator" do 
  				expect(assigns(:simulator)).to eq(simulator)
  			end 

  			it "should update the simulator" do 
  				simulator.reload
  				expect(simulator.name).to eq(valid_attributes[:name])
  			end

  			it "should redirect after update" do 
  				expect(response).to redirect_to(admin_simulator_path(simulator))
  			end
  		end

  		context "with invalid params" do 

  			it "should return http success" do 
  				put :update, params: { id: simulator.id, simulator: invalid_attributes }
  				expect(response).to have_http_status(:success)
  			end

  			it "should not change simulator" do 
  				expect do 
  					put :update, params: { id: simulator.id, simulator: invalid_attributes }
  				end.not_to change { simulator.reload.name }
  			end

  		end
  	end

  	describe "GET show" do 
  		before do 
  			get :show, params: { id: simulator.id }
  		end

  		it "should redirect to simulator's tracks" do 
  			expect(response).to redirect_to(admin_simulator_tracks_path(simulator))
  		end
  	end

  	describe "DELETE destroy" do 

  		it "should destroy the car" do 
  			expect {
  				delete :destroy, params: { id: simulator.id }
  			}.to change(Simulator, :count).by(-1)
  		end

  		it "should redirects to the field" do
	      delete :destroy, params: { id: simulator.id }
	      expect(response).to redirect_to(admin_simulators_path)
	    end

  	end

end
