class LoginController < ApplicationController
  def index
  end

  def create
    username = params[:username]
    # puts ">> LoginController :: create:: #{username}"
    user = User.where(["username = ?", username]).first
    # puts "#{user}"
    if user.nil?
      # puts "** Not found **"
      redirect_to login_index_path
    else
      # puts ">> user found !!"
      # puts "user.id : #{user.id}"
      session[:current_user_id] = user.id
      # puts "@current_user => #{session[:current_user_id]}"
      redirect_to quotes_path
    end
  end

  def logout
    puts "\n<< LoginController :: logout\n\n"
    session[:current_user_id] = nil
    redirect_to login_index_path
  end
end
