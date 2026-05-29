class CreateLessons < ActiveRecord::Migration[8.1]
  def change
    create_table :lessons do |t|
      t.references :practice, null: false, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
