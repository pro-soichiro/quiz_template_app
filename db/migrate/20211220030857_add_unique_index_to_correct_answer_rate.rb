class AddUniqueIndexToCorrectAnswerRate < ActiveRecord::Migration[5.2]
  def change
    add_index :correct_answer_rates, [:staff_id, :question_id], unique: true
  end
end
