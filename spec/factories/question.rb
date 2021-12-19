FactoryBot.define do
  factory :question do
    question_text { Faker::Lorem.characters(number:30) }
    category
  end
end