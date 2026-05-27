class RenameSchoolYearToyear_group_id < ActiveRecord::Migration[8.1]
  def change
    rename_column :students, :school_year, :year_group_id
  end
end
