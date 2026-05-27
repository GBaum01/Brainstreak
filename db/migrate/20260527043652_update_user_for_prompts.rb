class UpdateUserForPrompts < ActiveRecord::Migration[8.1]
  def change
    remove_reference :prompts, :user, foreign_key: true
    add_reference :prompts, :student, foreign_key: true
  end
end
