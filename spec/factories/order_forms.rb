FactoryBot.define do
  factory :order_form do

    item_id { Faker::Number.between(from: 1, to: 100) }
    user_id { Faker::Number.between(from: 1, to: 100) }
    postal_code { Faker::Number.number(digits: 3).to_s + '-' + Faker::Number.number(digits: 4).to_s }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    city { Faker::Address.city }
    street_address { Faker::Address.street_address }
    building { Faker::Address.secondary_address }
    phone_number { Faker::Number.number(digits: [10, 11].sample).to_s }

  end
end
