class Choice < ApplicationRecord
  belongs_to :question

  validates :question_id, presence: true
  validates :content, presence: true
end
