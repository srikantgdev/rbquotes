class LoginController < ApplicationController
  def index
  end

  def create
    username = params[:username]
    user = User.where(["username = ?", username]).first
    if user.blank?
      flash[:alert] = "User #{username} not found."
      redirect_to login_index_path
    else
      current_user = user
      session[:current_user_id] = user.id
      redirect_to quotes_path
    end
  end

  def logout
    session[:current_user_id] = nil
    redirect_to login_index_path
  end
end
