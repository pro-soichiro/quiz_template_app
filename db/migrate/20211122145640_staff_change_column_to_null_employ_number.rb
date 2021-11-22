class StaffChangeColumnToNullEmployNumber < ActiveRecord::Migration[5.2]
  def change
    change_column_null :staffs, :employ_number, from: true, to: false
  end
end
