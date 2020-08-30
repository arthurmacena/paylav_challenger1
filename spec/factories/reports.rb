FactoryBot.define do
    factory :report do
        purchaser_name      { Faker::Name.name }
        item_description    { Faker::Lorem.sentence }
        item_price          { Faker::Number.decimal(l_digits: 2) }
        purchase_count      { Faker::Number.within(range: 1..1000) }
        merchant_address    { Faker::Lorem.sentence }
        merchant_name       { Faker::Name.name }
    end
end