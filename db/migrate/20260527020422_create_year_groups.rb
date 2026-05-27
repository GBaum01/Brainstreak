class CreateYearGroups < ActiveRecord::Migration[8.1]
  def change
    create_table :year_groups do |t|
      t.string :name

      t.timestamps
    end
  end
end
