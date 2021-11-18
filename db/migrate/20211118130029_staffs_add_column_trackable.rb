class StaffsAddColumnTrackable < ActiveRecord::Migration[5.2]
  def change
    add_column :staffs,:sign_in_count,:integer,default: 0, null: false
    add_column :staffs,:last_sign_in_at,:datetime
    add_column :staffs,:current_sign_in_ip,:string
    add_column :staffs,:last_sign_in_ip,:string
  end
end
