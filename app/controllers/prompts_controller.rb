class PromptsController < ApplicationController
  # GET /prompts/new
  def new
    @prompt = Prompt.new
    @curriculums = Curriculum.all
    @topics = Topic.all
  end

  # POST /students/:student_id/prompts
  def create
    @student = Student.find(params[:student_id])
    @prompt = Prompt.new(prompt_params)
    @prompt.student = @student
    @prompt.year_level = @student.yeargroup

    @prompt.questions_json = generate_ai_questions(@prompt)

    if @prompt.save
      redirect_to prompt_path(@prompt), status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /prompts/:id
  def show
    @prompt = Prompt.find(params[:id])
  end

  private

  def generate_ai_questions(prompt)
    chat = RubyLLM.chat

    curriculum_name = Curriculum.find(prompt.curriculum_id).name
    topic_name = Topic.find(prompt.topic_id).name

    ai_prompt = <<~PROMPT
      Generate 10 multiple choice mathematics questions for Year #{prompt.year_level}.
      Curriculum: #{curriculum_name}
      Topic: #{topic_name}
      Difficulty: #{prompt.difficulty_level}

      Return as JSON with: question_text, options (A,B,C,D), correct_answer, explanation
    PROMPT

    response = chat.ask(ai_prompt)
    response.content
  end

  def prompt_params
    params.require(:prompt).permit(:difficulty_level, :subject)
  end
end
