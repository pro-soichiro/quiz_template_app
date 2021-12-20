class AddUniqueIndexToChoice < ActiveRecord::Migration[5.2]
  def change
    add_index :choices, [:question_id,:choice_text], unique: true
  end
end
