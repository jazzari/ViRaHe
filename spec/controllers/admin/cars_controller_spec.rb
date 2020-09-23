require 'rails_helper'

RSpec.describe Admin::CarsController, type: :controller do 
	render_views

	let(:page) { Capybara::Node::Simple.new(response.body) } 
	user = FactoryBot.create :user, :admin
	let(:valid_attributes) do 
		FactoryBot.attributes_for :car
	end
	let(:invalid_attributes) do 
		{ name: "" }
	end
	let!(:car) { FactoryBot.create :car }

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
  			expect(page).to have_content(car.name)
  		end

  	end

  	describe "GET edit" do 
  		before do 
  			get :edit, params: { id: car.id }
  		end

  		it "should return http success" do 
  			expect(response).to have_http_status(:success)
  		end

  		it "should render form's elements" do 
  			expect(page).to have_field('Car Name', with: car.name)
  		end
  	end

  	describe "PUT update" do 
  		context "with valid params" do 
  			before do 
  				put :update, params: { id: car.id, car: valid_attributes }
  			end

  			it "should assign the car" do 
  				expect(assigns(:car)).to eq(car)
  			end 

  			it "should update the car" do 
  				car.reload
  				expect(car.name).to eq(valid_attributes[:name])
  			end

  			it "should redirect after update" do 
  				expect(response).to redirect_to(admin_car_path(car))
  			end
  		end

  		context "with invalid params" do 

  			it "should return http success" do 
  				put :update, params: { id: car.id, car: invalid_attributes }
  				expect(response).to have_http_status(:success)
  			end

  			it "should not change car" do 
  				expect do 
  					put :update, params: { id: car.id, car: invalid_attributes }
  				end.not_to change { car.reload.name }
  			end

  		end
  	end

  	describe "GET show" do 
  		before do 
  			get :show, params: { id: car.id }
  		end

  		it "should return http success" do 
  			expect(response).to have_http_status(:success)
  		end

  	end


end