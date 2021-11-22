class CategoriesChangeColumnToNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :categories, :name, from: false,to: true
  end
end
