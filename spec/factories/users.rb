FactoryBot.define do
  factory :user do
    email { "visitor@example.org" }
    password { "password" }
    password_confirmation { "password" }
    admin { false }
    #confirmed_at Time.now

    trait :admin do 
    	admin { true }
	end
  end
end
