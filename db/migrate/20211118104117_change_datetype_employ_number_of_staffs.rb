class ChangeDatetypeEmployNumberOfStaffs < ActiveRecord::Migration[5.2]
  def change
    change_column :staffs, :employ_number, :string
  end
end
