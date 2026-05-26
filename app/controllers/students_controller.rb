class StudentsController < ApplicationController
  before_action :set_user

  def new
    @student = @user.students.new
  end

  def create
    @student = @user.students.new(student_params)
    if @student.save
      redirect_to family_path, notice: "Student added"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @student = @user.students.find(params[:id])
    @student.destroy
    redirect_to family_path, notice: "Student removed"
  end

  private

  def set_user
    @user = current_user
  end

  def student_params
    params.require(:student).permit(:first_name, :school_year)
  end
end
