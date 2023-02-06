FactoryBot.define do
  factory :user do
    company
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end
