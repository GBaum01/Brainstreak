class PracticesController < ApplicationController
  # GET /practices/:id (check progress)
  def show
    @practice = Practice.find(params[:id])
    answered_count = @practice.questions.where.not(status: nil).count

    render json: { answered_count: answered_count }
  end

  # POST /levels/:level_id/practices?student_id=1
  def create
    # 1. Create the practice
    @student = Student.find(params[:student_id])
    @level = Level.find(params[:level_id])
    @practice = Practice.new(student: @student, level: @level)
    # 2. Create the questions with ai
    generate_questions_for(@practice)

    if @practice.save
      @practice.reload
      if @practice.questions.any?
        redirect_to question_path(@practice.questions.first)
      else
        redirect_to student_path(@student), alert: "No questions were generated."
      end
    else
      redirect_to student_path(@student), alert: "Something went wrong..."
    end
  end

  def retake
    @practice = Practice.find(params[:id])

    # Reset score
    @practice.update(score: nil)

    # Reset questions
    @practice.questions.update_all(
      status: nil,
      student_answer: nil # only if you track this
    )

    # Redirect to first question
    first_question = @practice.questions.order(:id).first
    redirect_to question_path(first_question)
  end

  # POST /practices/:id/submit
  def submit
    @practice = Practice.find(params[:id])
    score = @practice.questions.where(status: true).count
    @practice.update(score: score)
    redirect_to recap_practice_path(@practice), notice: "Practice completed with score #{score}/10"
  end

  # GET /practices/:id/recap
  def recap
    @practice = Practice.find(params[:id])
    @questions = @practice.questions.order(:id)
  end

  private

  def generate_questions_for(practice) # rubocop:disable Metrics/MethodLength
    chat = RubyLLM.chat

    level_name = practice.level.name
    topic_name = practice.level.topic.name

    ai_prompt = <<~PROMPT
      Generate 10 mathematics questions for Year #{@student.year_group.name}.

      Topic: #{topic_name}
      Sub-topic: #{level_name}

      Questions should require a written numerical answer, not multiple choice.

      Return ONLY valid raw JSON.
      Do not include markdown code fences.
      Do not include explanations outside the JSON.
      Do not include any text before or after the JSON.

      Use this exact JSON structure:

      [
        {
          "question": "string",
          "correct_answer": "string or number",
          "explanation": "string"
        }
      ]
    PROMPT

    response = chat.ask(ai_prompt)
    questions_array = JSON.parse(response.content)
    # Create a Question object for each one
    questions_array.each do |question_hash|
      # questions_hash = {
      #   "question"=>"What is 64 plus 38?",
      #   "correct_answer"=>102,
      #   "explanation"=>"Adding 64 and 38 gives 102."
      # }
      practice.questions.build(question_hash)
    end
  end
end
