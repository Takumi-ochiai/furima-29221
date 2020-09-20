FactoryBot.define do
  factory :item do
    name                 { Faker::Name.initials(number: 40) }
    description          { Faker::Name.initials(number: 1000) }
    category_id          { 2 }
    state_id             { 3 }
    delivery_charge_id   { 2 }
    shipping_area_id     { 3 }
    shipping_day_id      { 2 }
    price                { 2000 }
    association :user

    after(:build) do |image|
      image.image.attach(io: File.open('public/images/5323996_ext_col_03_0.jpg'), filename: '5323996_ext_col_03_0.jpg')
    end
  end
end
