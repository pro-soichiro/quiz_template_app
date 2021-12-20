FactoryBot.define do
  factory :correct_answer_rate do
    status { Faker::Boolean.boolean }
    staff
    question
    category
  end
end
