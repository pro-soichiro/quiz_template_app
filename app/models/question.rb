class Question < ApplicationRecord
  belongs_to :category

  has_many :choices,                dependent: :destroy
  has_many :achievement_rates,      dependent: :destroy
  has_many :correct_answer_rates,   dependent: :destroy

  accepts_nested_attributes_for :choices


  attachment :image

  validates :category_id, presence: true
  validates :content, presence: true

end
