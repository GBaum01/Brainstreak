class RenameStudentNameToFirstName < ActiveRecord::Migration[8.1]
  def change
    rename_column :students, :name, :name
  end
end
