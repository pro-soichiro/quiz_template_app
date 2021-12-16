class RemoveSelectedFromAchievementRate < ActiveRecord::Migration[5.2]
  def change
    remove_column :achievement_rates, :selected, :integer
  end
end
