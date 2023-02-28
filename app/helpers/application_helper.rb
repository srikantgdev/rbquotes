module ApplicationHelper
  def login_userid
    session[:current_user_id]
  end

  def login_username
    User.find(session[:current_user_id]).username
  end
end
