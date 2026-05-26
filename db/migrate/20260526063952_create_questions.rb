class CreateQuestions < ActiveRecord::Migration[8.1]
  def change
    create_table :questions do |t|
      t.text :question
      t.float :correct_answer
      t.boolean :status
      t.references :practice, null: false, foreign_key: true

      t.timestamps
    end
  end
end
