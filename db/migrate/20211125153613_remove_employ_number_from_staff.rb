class RemoveEmployNumberFromStaff < ActiveRecord::Migration[5.2]
  def change
    remove_column :staffs, :employ_number, :integer
  end
end
