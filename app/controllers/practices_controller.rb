class PracticesController < ApplicationController
  # POST /students/:student_id/practices
  def create
    # 1. Create the practice
    @student = Student.find(params[:student_id])
    @practice = Practice.new(student: @student)
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

  private

  def generate_questions_for(practice)
    chat = RubyLLM.chat

    topic_name = "Addition and Subtraction"
    level_name = "Add two-digit and three-digit numbers"
    difficulty_level = 3

    ai_prompt = <<~PROMPT
      Generate 10 mathematics questions for Year #{@student.year_group.name}.

      Topic: #{topic_name}
      Sub-topic: #{level_name}
      Difficulty: #{difficulty_level}/5

      Questions should require a written answer, not multiple choice.

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
