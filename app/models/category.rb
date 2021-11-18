class Category < ApplicationRecord
  has_many :questions, dependent: :dest
end
