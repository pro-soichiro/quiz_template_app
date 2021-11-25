class AchievementRatesAddColumnCategoryId < ActiveRecord::Migration[5.2]
  def change
    add_column :achievement_rates,:category_id,:integer
  end
end
