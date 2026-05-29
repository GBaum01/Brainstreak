class RenameCarriculumToYearGroupInTopics < ActiveRecord::Migration[8.1]
  def change
    rename_column :topics, :curriculum_id, :year_group_id
  end
end
