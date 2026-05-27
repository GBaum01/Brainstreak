class PromptsController < ApplicationController
  before_action :authenticate_user!

  # GET /prompts/new
  def new
    @prompt = Prompt.new
  end

  # POST /prompts
  def create
    # 1. Create a prompt with strong params
    @prompt = Prompt.new(prompt_params)
    @prompt.user = current_user

    # 2. Generate AI questions based on criteria
    @prompt.questions_json = generate_ai_questions(@prompt)

    # 3. Save it
    if @prompt.save
      redirect_to prompt_path(@prompt), status: :see_other, notice: "Questions generated successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /prompts/:id
  def show
    @prompt = Prompt.find(params[:id])
    @questions = JSON.parse(@prompt.questions_json) if @prompt.questions_json
  end

  private

  def generate_ai_questions(prompt)
    chat = RubyLLM.chat

    ai_prompt = <<~PROMPT
      Generate 10 multiple choice mathematics questions for a Year #{prompt.year_level} student at difficulty level #{prompt.difficulty_level} (1=easiest, 5=hardest).

      Requirements:
      - Format as JSON with array of questions
      - Each question has: question_text, options (A, B, C, D), correct_answer, explanation
      - Questions aligned to Victorian curriculum
      - Age-appropriate content

      Return ONLY valid JSON, no markdown or extra text.
    PROMPT

    response = chat.ask(ai_prompt)
    response.content
  end

  def prompt_params
    params.require(:prompt).permit(:year_level, :difficulty_level, :subject)
  end
end
