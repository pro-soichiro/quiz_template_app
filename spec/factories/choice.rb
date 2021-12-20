FactoryBot.define do
  factory :choice do
    question
    choice_text { Faker::Lorem.characters(number: 30) }
  end
end
