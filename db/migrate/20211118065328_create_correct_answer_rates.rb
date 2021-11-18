class CreateCorrectAnswerRates < ActiveRecord::Migration[5.2]
  def change
    create_table :correct_answer_rates do |t|
      t.integer :staff_id
      t.integer :question_id
      t.boolean :status

      t.timestamps
    end
  end
end
