class ChangeDatetypeEmployNumberOfAdminsInteger < ActiveRecord::Migration[5.2]
  def change
    change_column :admins, :employ_number, :integer
  end
end
