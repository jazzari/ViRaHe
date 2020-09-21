require 'rails_helper'

RSpec.describe Track, type: :model do
	describe '#Validations' do 

		it "should have valid factory" do 
			expect(FactoryBot.build :track).to be_valid
		end

		it "can't be created without a user" do 
      		track = FactoryBot.build :track, simulator_id: ''
      		expect(track).not_to be_valid
    	end

    	it "should validate presence of name" do 
    		track = FactoryBot.build :track, name: ''
      		expect(track).not_to be_valid	
    	end

	end
end
