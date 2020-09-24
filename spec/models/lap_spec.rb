require 'rails_helper'

RSpec.describe Lap, type: :model do

  describe '#validations' do 
    let(:user) do
        create :user
    end
        let(:simulator) do
        create :simulator
    end

  	it "should test that the factory is valid" do 
  		expect(FactoryBot.build :lap).to be_valid
  	end

  end

end