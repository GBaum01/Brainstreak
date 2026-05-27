class CreatePrompts < ActiveRecord::Migration[7.1]
  def change
    create_table :prompts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :module, null: false, foreign_key: true
      t.references :topic, null: false, foreign_key: true
      t.integer :year_level
      t.integer :difficulty_level
      t.text :questions_json

      t.timestamps
    end
  end
end
