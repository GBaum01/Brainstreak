class Removeyear_group_idFromStudents < ActiveRecord::Migration[8.1]
  def change
    remove_column :students, :year_group_id, :integer
  end
end
