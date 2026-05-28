class AddYearGroupToStudents < ActiveRecord::Migration[8.1]
  def change
    add_reference :students, :year_group, null: false, foreign_key: true
    remove_column :students, :age, :integer
  end
end
