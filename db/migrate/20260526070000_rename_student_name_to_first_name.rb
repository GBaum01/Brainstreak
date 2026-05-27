class RenameStudentNameToFirstName < ActiveRecord::Migration[8.1]
  def change
    rename_column :students, :name, :first_name
  end
end
