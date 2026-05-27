class AddMissingFieldsToStudents < ActiveRecord::Migration[8.1]
  def change
    add_column :students, :school_year, :integer
    add_column :students, :australian_state, :string
  end
end
