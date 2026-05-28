class AddLevelToPractices < ActiveRecord::Migration[8.1]
  def change
    add_reference :practices, :level, null: true, foreign_key: true
  end
end
