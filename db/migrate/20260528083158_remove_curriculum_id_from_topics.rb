class RemoveCurriculumIdFromTopics < ActiveRecord::Migration[8.1]
  def change
    remove_column :topics, :curriculum_id, :bigint
  end
end
