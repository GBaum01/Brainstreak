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

  # POST /questions/:id/answer
  def answer
    @question = Question.find(params[:id])
    user_answer = params[:answer].to_s.strip
    correct_answer = @question.correct_answer.to_s.strip

    is_correct = user_answer.downcase == correct_answer.downcase

    @question.update(status: is_correct)

    render json: {
      correct: is_correct,
      answer: correct_answer
    }
  end
end
