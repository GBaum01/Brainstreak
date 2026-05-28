class AddYearGroupToTopics < ActiveRecord::Migration[8.1]
  def change
    add_reference :topics, :year_group, null: false, foreign_key: true
  end
end
