class StudentsController < ApplicationController
  before_action :set_user

  def new
    @student = @user.students.new
  end

  def create
    @student = @user.students.new(student_params)
    if @student.save
      redirect_to family_path
    else
      render :new
    end
  end

  def destroy
    @student = @user.students.find(params[:id])
    @student.destroy
    redirect_to family_path
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def student_params
    params.require(:student).permit(:first_name, :year_group_id)
  end
end
