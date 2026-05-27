class CreatePrompts < ActiveRecord::Migration[8.1]
  def change
    create_table :prompts do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :year_level
      t.integer :difficulty_level
      t.string :subject
      t.text :questions_json

      t.timestamps
    end
  end
end
