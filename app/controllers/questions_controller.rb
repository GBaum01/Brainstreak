class QuestionsController < ApplicationController
  # GET /questions/:id
  layout "application_no_nav"
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

    user_number = parse_numeric_answer(user_answer)
    correct_number = parse_numeric_answer(correct_answer)

    is_correct = if user_number && correct_number
                   user_number == correct_number
                 else
                   user_answer.downcase == correct_answer.downcase
                 end

    @question.update(status: is_correct, submitted_answer: user_answer)

    render json: {
      correct: is_correct,
      answer: correct_answer
    }
  end

  private

  def parse_numeric_answer(value)
    text = value.to_s.strip
    return nil if text.blank?

    numeric_pattern = /\A[-+]?(?:\d+\.?\d*|\.\d+)\z/
    return text.to_f if numeric_pattern.match?(text)

    nil
  end
end
