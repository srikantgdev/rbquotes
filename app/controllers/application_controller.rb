class ApplicationController < ActionController::Base
  # before_action :user_authenticate

  # protect_from_forgery with: :null_session,
  #     if: Proc.new { |c| c.request.format =~ %r{application/json} }

  def current_user=(user)
    puts "*> ApplicationController #{user}"
    session[:current_user]=user
  end

  def current_user
    return unless session[:current_user]
    @current_user = session[:current_user]
  end

  # def user_authenticate
  #   current_user ||= session[:current_user]
  #   if current_user.nil?
  #     redirect_to login_index_path
  #   else
  #     redirect_to quotes_path
  #   end
  # end


end
