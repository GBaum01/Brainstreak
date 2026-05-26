class PagesController < ApplicationController
  def home
    if current_user
      redirect_to family_path
    else
      redirect_to new_user_path
    end
  end
end
