class AchievementRate < ApplicationRecord
  belongs_to :staff
  belongs_to :question
  belongs_to :category

  validates :staff_id, uniqueness: {
    scope: [:question_id]
  }

end
