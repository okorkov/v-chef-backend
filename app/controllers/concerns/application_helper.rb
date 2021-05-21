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

  def define_admin
    @admin = current_user
  end

  def create_content_from_hash(key, value, blog)
    if key[0] == 't' 
      blog.contents << Content.create(content_type: 'text', value: value)
    elsif key[0] == 'i' 
      blog.contents << Content.create(content_type: 'image', value: value)
    elsif key[0] == 'v'
      blog.contents << Content.create(content_type: 'video', value: "https://www.youtube.com/embed/" + value)
    end
  end

end