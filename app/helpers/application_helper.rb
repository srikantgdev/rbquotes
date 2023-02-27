module ApplicationHelper
  def current_user=(user)
    session[:current_user_id] = user
  end

  def current_user
    session[:current_user_id] if !!session[:current_user_id]
  end

  def login_username_id
    session[:current_user_id]
  end

  def login_username
    User.find(session[:current_user_id]).username
  end
end
