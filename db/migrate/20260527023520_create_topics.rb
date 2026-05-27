class CreateTopics < ActiveRecord::Migration[8.1]
  def change
    create_table :topics do |t|
      t.string :name
      t.references :year_group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
