class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.integer :category_id  ,null:false
      t.text :content         ,null:false
      t.string :image_id

      t.timestamps
    end
  end
end
