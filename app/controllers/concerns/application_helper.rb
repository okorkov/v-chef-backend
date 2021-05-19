module ApplicationHelper

  def current_user
   User.find_by(id: session[:user_id])
  end

  def require_login
    redirect_to new_session_path if !current_user
  end

  def logged_in?
    session[:user_id] != nil
  end

end