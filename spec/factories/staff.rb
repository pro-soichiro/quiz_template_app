FactoryBot.define do
  factory :staff do
    transient do
      person { Gimei.name }
    end
    email { Faker::Internet.email }
    first_name { person.first.kanji }
    first_name_kana { person.first.katakana }
    last_name { person.last.kanji }
    last_name_kana { person.last.katakana }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
