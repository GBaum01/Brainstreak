class FixTopicsForeignKey < ActiveRecord::Migration[8.1]
  def change
    remove_foreign_key :topics, column: :year_group_id
    add_foreign_key :topics, :year_groups, column: :year_group_id
  end
end
