class CleanupStudentsColumns < ActiveRecord::Migration[8.1]
  def change
    # Rename legacy first_name to name
    if column_exists?(:students, :first_name)
      rename_column :students, :first_name, :name
    end

    # Remove unwanted columns if present
    if column_exists?(:students, :state)
      remove_column :students, :state, :string
    end

    if column_exists?(:students, :yeargroup)
      remove_column :students, :yeargroup, :integer
    end
  end
end
