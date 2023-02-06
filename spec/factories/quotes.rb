FactoryBot.define do
  factory :quote do
    company
    name { Faker::Quote.famous_last_words }
  end
end
