class QuestionsController < ApplicationController
  # GET /questions/:id
  def show
    @question = Question.find(params[:id])
    @practice = @question.practice
    @position = @practice.questions.to_a.index(@question) + 1
  end
end
