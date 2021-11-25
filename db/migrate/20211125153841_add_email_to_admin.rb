class AddEmailToAdmin < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :email, :string
  end
end
