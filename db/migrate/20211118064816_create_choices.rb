class CreateChoices < ActiveRecord::Migration[5.2]
  def change
    create_table :choices do |t|
      t.integer :question_id
      t.text :content
      t.boolean :is_answer

      t.timestamps
    end
  end
end
