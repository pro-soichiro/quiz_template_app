class ChangeColumnToNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :staffs, :image_id, from: false,to: true
  end
end
