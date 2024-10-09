FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { "password123" }
    password_confirmation { "password123" }
    nickname { Faker::Internet.username }
    
    trait :with_invalid_nickname do
      nickname { nil }
    end
  end
end
