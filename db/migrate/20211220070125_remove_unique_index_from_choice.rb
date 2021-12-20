class RemoveUniqueIndexFromChoice < ActiveRecord::Migration[5.2]
  def change
    remove_index :choices, [:question_id,:choice_text]
  end
end
