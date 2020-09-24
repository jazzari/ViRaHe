FactoryBot.define do
  factory :lap do
    time { 2000 }
    setting { false }
    hardware { false }
    notes { "MyText" }
	association :user
    association :simulator
    association :track
    association :car
  end
end
