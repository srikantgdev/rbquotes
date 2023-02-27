class ApplicationController < ActionController::Base
  before_action :user_authenticate!

  def current_user
    return nil unless session[:current_user_id].present?
    User.find(session[:current_user_id])
  end

  def user_authenticate!
    # redirect_to {controller: user, action: login} unless current_user.present?
    redirect_to users_path unless current_user.present?
  end


end
