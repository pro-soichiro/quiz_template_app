FactoryBot.define do
  factory :achievement_rate do
    status { Faker::Boolean.boolean }
    staff
    question
    category
  end
end
