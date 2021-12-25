class Question < ApplicationRecord
  extend OrderAsSpecified

  belongs_to :category

  has_many :choices,                dependent: :destroy
  has_many :achievement_rates,      dependent: :destroy
  has_many :correct_answer_rates,   dependent: :destroy

  attachment :image

  validates :category_id, presence: true
  validates :question_text, presence: true

  accepts_nested_attributes_for :choices, allow_destroy: true

  ransacker :id do
    Arel.sql("CAST(#{table_name}.id as CHAR(8))")
  end

  def true_answer_check(q)
    @array = []
    q.choices.each do |choice|
      @array << choice.is_answer
    end
    if @array.none?
      q.choices[0].is_answer = true
    end
  end
end
