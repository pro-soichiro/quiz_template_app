class CorrectAnswerRate < ApplicationRecord
  belongs_to :staff
  belongs_to :question
  belongs_to :category
end
