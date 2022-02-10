class NewController < ApplicationController
  def show
    if @user.save
      flash[:notice] = "Welcome! You have signed up successfully."
        redirect_to user_path(current_user)
    else
    render :new_user_registration_path
    end
  end

  def index
  end
end
