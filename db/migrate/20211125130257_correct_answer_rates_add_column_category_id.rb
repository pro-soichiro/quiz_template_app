class CorrectAnswerRatesAddColumnCategoryId < ActiveRecord::Migration[5.2]
  def change
    add_column :correct_answer_rates,:category_id,:integer
  end
end
