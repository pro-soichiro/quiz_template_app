class RenameColumnQuestionContentToQuestionText < ActiveRecord::Migration[5.2]
  def change
    rename_column :questions, :content, :question_text
  end
end
