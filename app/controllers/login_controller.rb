class LoginController < ApplicationController
  def index
  end

  def create
    username = params[:username]
    user = User.where(["username = ?", username]).first
    if user.nil?
      @message = "not found"
      flash.now[:alert] = "User #{username} not found."
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
