class AddExplanationToQuestions < ActiveRecord::Migration[8.1]
  def change
    add_column :questions, :explanation, :text
    remove_column :questions, :correct_answer, :float
    add_column :questions, :correct_answer, :text
  end
end
