class StudentsController < ApplicationController
  before_action :set_user
  before_action :set_year_groups, only: %i[new create]

  def new
    @student = @user.students.new
  end

  def create
    @student = @user.students.new(student_params)

    if @student.save
      redirect_to family_path
    else
      render :new, status: :unprocessable_entity
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

  def set_year_groups
    @year_groups = YearGroup.order(:name)
  end

  def student_params
    params.require(:student).permit(:name, :year_group_id)
  end
end
