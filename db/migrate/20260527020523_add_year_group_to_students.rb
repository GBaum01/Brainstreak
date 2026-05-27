class AddYearGroupToStudents < ActiveRecord::Migration[8.1]
  def change
    add_reference :students, :year_group, null: false, foreign_key: true
  end
end
