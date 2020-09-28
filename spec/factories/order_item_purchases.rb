FactoryBot.define do
  factory :order_item_purchase do
    postal_code          { 1_234_567 }
    prefecture_id        { 2 }
    city                 { '横浜市緑区' }
    house_number         { '青山 1-1-1' }
    phone_number         { '09012345678' }
    token                { Faker::Name.initials(number: 10) }
  end
end
