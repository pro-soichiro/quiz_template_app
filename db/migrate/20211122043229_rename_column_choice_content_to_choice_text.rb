class RenameColumnChoiceContentToChoiceText < ActiveRecord::Migration[5.2]
  def change
    rename_column :choices, :content, :choice_text
  end
end
