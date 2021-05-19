module ApplicationHelper

  def current_user
   User.find_by(id: session[:user_id])
  end

  def require_login
    if !current_user
      redirect_to new_session_path
    end
  end

end