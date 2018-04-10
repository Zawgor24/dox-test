FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    age { 21 }
    name { Faker::Name.name }
  end
end