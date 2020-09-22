require 'rails_helper'

RSpec.describe Car, type: :model do
	describe '#Validations' do 

		it "should have valid factory" do 
			expect(FactoryBot.build :car).to be_valid
		end

		it "can't be created without a user" do 
      		car = FactoryBot.build :car, simulator_id: ''
      		expect(car).not_to be_valid
    	end

    	it "should validate presence of name" do 
    		car = FactoryBot.build :car, name: ''
      		expect(car).not_to be_valid	
    	end

	end
end
