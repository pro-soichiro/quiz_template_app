class Question < ApplicationRecord
  belongs_to :category

  has_many :choices,                dependent: :destroy
  has_many :achievement_rates,      dependent: :destroy
  has_many :correct_answer_rates,   dependent: :destroy

  attachment :image

  validates :category_id, presence: true
  validates :question_text, presence: true

	accepts_nested_attributes_for :choices , allow_destroy: true

end
