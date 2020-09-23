FactoryBot.define do
  factory :user do
  	name { "Some User" }
    email {  "visitor@example.org" }
    password { "password" }
    password_confirmation { "password" }
    #confirmed_at Time.now
    trait :admin do 
      admin { true }
    end
  end
end
