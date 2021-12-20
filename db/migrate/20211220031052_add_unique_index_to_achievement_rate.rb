class AddUniqueIndexToAchievementRate < ActiveRecord::Migration[5.2]
  def change
    add_index :achievement_rates, [:staff_id, :question_id], unique: true
  end
end
