class LessonsController < ApplicationController
  before_action :set_practice
  def show
    @lesson = @practice.lesson
  end

  def create
    @lesson = @practice.build_lesson
    # AI generation will go here later
    @lesson.content = generate_lesson_for(@practice)
    if @lesson.save
      redirect_to practice_lesson_path(@practice)
    else
      redirect_to practice_path(@practice), alert: "Could not generate lesson"
    end
  end

  def update
    @lesson = @practice.lesson
    @lesson.content = "**Updated Lesson**\n\n" + generate_lesson_for(@practice)
    if @lesson.save
      redirect_to practice_lesson_path(@practice)
    else
      redirect_to practice_lesson_path(@practice), alert: "Could not regenerate lesson"
    end
  end

  private

  def set_practice
    @practice = Practice.find(params[:practice_id])
    @student = @practice.student
    @user = @student.user
  end

  def generate_lesson_for(practice)
    chat = RubyLLM.chat

    wrong_questions = practice.questions.where(status: false)
    correct_count = practice.questions.where(status: true).count
    total_count = practice.questions.count

    ai_prompt = <<~PROMPT
      A student just completed a mathematics practice session.

      Score: #{correct_count}/#{total_count}

      Questions they got wrong:
      #{wrong_questions.map { |q| "- #{q.question} (correct answer: #{q.correct_answer})" }.join("\n")}

      Please write a short lesson in Markdown that includes:
      ## Recap
      A brief explanation of the topic covered.

      ## Areas to Review
      A deeper look at the questions the student got wrong and why, with tips to improve.

      Keep it encouraging and simple for a young student.
    PROMPT

    response = chat.ask(ai_prompt)
    response.content
  end
end
