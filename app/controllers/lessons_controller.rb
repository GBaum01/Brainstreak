class LessonsController < ApplicationController
  def show
    @lesson = @practice.lesson
  end

  def create
    @lesson = @practice.build_lesson
    # AI generation will go here later
    @lesson.content = "Lesson coming soon..."
    if @lesson.save
      redirect_to practice_lesson_path(@practice)
    else
      redirect_to practice_path(@practice), alert: "Could not generate lesson"
    end
  end

  private

  def set_practice
    @practice = Practice.find(params[:practice_id])
  end
end
