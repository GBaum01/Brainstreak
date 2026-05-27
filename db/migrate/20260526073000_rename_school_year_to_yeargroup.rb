class RenameSchoolYearToYeargroup < ActiveRecord::Migration[8.1]
  def change
    rename_column :students, :school_year, :yeargroup
  end
end
