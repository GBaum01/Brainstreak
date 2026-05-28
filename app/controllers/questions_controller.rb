class QuestionsController < ApplicationController
  # GET /questions/:id
  def show
    @question = Question.find(params[:id])
    @practice = @question.practice

    questions = @practice.questions.order(:id).to_a

    index = questions.index(@question)

    @position = index + 1
    @next_question = questions[index + 1]
    @previous_question = index.positive? ? questions[index - 1] : nil
  end
end
