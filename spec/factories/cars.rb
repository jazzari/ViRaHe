FactoryBot.define do
  factory :car do
    name { "Car01" }
	association :simulator
  end
end
