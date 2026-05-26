class SessionsController < ApplicationController
  def new
  end

  def create
    login = params[:login].to_s.strip.downcase
    user = User.where("lower(email) = ? OR lower(username) = ?", login, login).first

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to family_path
    else
      flash.now[:alert] = "Invalid username/email or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
