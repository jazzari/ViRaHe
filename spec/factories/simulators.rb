FactoryBot.define do 
	factory :simulator do 
		sequence(:name) { |n| "simulator N #{n}" }
	end
end
