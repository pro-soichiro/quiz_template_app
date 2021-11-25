class AchievementRate < ApplicationRecord
  belongs_to :staff
  belongs_to :question
  belongs_to :achievement_rate, optional: true
end
