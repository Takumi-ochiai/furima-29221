FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 {Faker::Internet.free_email}
    password              {'abc123'}
    password_confirmation {password}
    family_name           {'鈴木'}
    first_name            {'一郎'}
    family_name_kana      {'スズキ'}
    first_name_kana       {'イチロウ'}
    birthday              {'1993-01-01'}
  end
end
