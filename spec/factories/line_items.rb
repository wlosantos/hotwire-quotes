FactoryBot.define do
  factory :line_item do
    line_item_date
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.sentence }
    quantity { rand(1...10) }
    unit_price { rand(2.0...100.0) }
  end
end
