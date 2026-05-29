class AddSubmittedAnswerToQuestions < ActiveRecord::Migration[8.1]
  def change
    add_column :questions, :submitted_answer, :text
  end
end
