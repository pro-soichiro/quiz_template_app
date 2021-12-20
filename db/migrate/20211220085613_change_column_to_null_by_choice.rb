class ChangeColumnToNullByChoice < ActiveRecord::Migration[5.2]
  def change
    change_column_null :choices, :question_id, true
  end
end
