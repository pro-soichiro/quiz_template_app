class ChangeDatetypeEmployNumberOfAdmins < ActiveRecord::Migration[5.2]
  def change
    change_column :admins, :employ_number, :string
  end
end
