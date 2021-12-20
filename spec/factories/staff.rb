FactoryBot.define do
  factory :staff do
    email { Faker::Internet.email }
    first_name { Faker::Lorem.characters(number: 4) }
    first_name_kana { 'カタカナ' }
    last_name { Faker::Lorem.characters(number: 4) }
    last_name_kana { 'カタカナ' }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
