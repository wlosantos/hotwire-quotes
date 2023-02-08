FactoryBot.define do
  factory :line_item_date do
    date { rand((Time.zone.today)...(Time.zone.today + 31.days)) }
    quote
  end
end
