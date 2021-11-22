class Question < ApplicationRecord
  belongs_to :category

  has_many :choices,                dependent: :destroy
  has_many :achievement_rates,      dependent: :destroy
  has_many :correct_answer_rates,   dependent: :destroy

  attachment :image


end
