class RemoveEmployNumberFromAdmin < ActiveRecord::Migration[5.2]
  def change
    remove_column :admins, :employ_number, :integer
  end
end
