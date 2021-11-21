class CategoriesChangeColumnToNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :categories, :name, from: true,to: false
  end
end
