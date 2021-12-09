class Staff < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  extend OrderAsSpecified

  has_many :achievement_rates,      dependent: :destroy
  has_many :correct_answer_rates,  dependent: :destroy
  attachment :image

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :email, presence: true, uniqueness: true

  def full_name
    last_name + " " + first_name
  end

  def full_name_kana
    last_name_kana + " " + first_name_kana
  end

  # 達成率メソッド
  def achievement_rates(category_id = nil)
    true_count_data = AchievementRate.where(staff_id: self.id).where(status: true)

    if category_id
      true_count = true_count_data.where(category_id: category_id).count
      all_count = Question.where(category_id: category_id).count
    else
      true_count = true_count_data.count
      all_count = Question.all.count
    end

    achievement_rates = ( true_count * 100 / all_count rescue 0)
    return achievement_rates
  end

  # 正答率メソッド
  def correct_rates(category_id = nil)
    if category_id
      correct_answer_rates = CorrectAnswerRate.where(staff_id: self.id).where(category_id: category_id)
    else
      correct_answer_rates = CorrectAnswerRate.where(staff_id: self.id)
    end
    all_count = correct_answer_rates.count
    correct_count = correct_answer_rates.where(status: true).count
    correct_rates = (correct_count * 100 / all_count rescue 0)
    return correct_rates
  end

end
