class CreatePractices < ActiveRecord::Migration[8.1]
  def change
    create_table :practices do |t|
      t.references :student, null: false, foreign_key: true
      t.integer :score
      t.boolean :status

      t.timestamps
    end
  end
end
