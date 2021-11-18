class ChangeColumnDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default :staffs, :status, from: nil, to: true
  end
end
