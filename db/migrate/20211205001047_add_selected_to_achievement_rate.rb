class AddSelectedToAchievementRate < ActiveRecord::Migration[5.2]
  def change
    add_column :achievement_rates, :selected, :integer
  end
end
