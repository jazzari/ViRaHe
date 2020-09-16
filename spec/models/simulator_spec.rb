require 'rails_helper'

RSpec.describe Simulator, type: :model do

	describe '#Validations' do 

		it "should have valid factory" do 
			expect(FactoryBot.build :simulator).to be_valid
		end

    	it "should validate presence of name" do 
    		simulator = FactoryBot.build :simulator, name: ''
      		expect(simulator).not_to be_valid	
    	end

	end

end
