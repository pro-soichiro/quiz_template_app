class Staff < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_many :achievement_rates,      dependent: :destroy
  has_many :correct_answer_rates,  dependent: :destroy


  def full_name
    last_name + " " + first_name
  end
  

  
end
