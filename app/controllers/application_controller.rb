class ApplicationController < ActionController::Base
  # before_action :user_authenticate
  protect_from_forgery with: :null_session,
      if: Proc.new { |c| c.request.format =~ %r{application/json} }

  def set_cache_buster
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end
  
  def current_user=(user)
    session[:current_user_id]=user.id
  end
  
  def current_user
    return nil unless session[:current_user_id]
    @current_user ||= User.find(session[:current_user_id])
  end
  helper_method :current_user
  # def user_authenticate
  #   current_user ||= session[:current_user]
  #   if current_user.nil?
  #     redirect_to login_index_path
  #   else
  #     redirect_to quotes_path
  #   end
  # end


end
