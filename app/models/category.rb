class Category < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :achievement_rates, dependent: :destroy

  validates :name, presence: true
end
