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

  def render_single_blog(params)
    blog = Blog.find_by_id(params[:id])
    if blog
      render json: blog, except: [:user_id, :status] , include: [:contents => {except: [:created_at, :updated_at, :blog_id]}]
    else 
      render json: {error: 'Blog Not Found'}
    end
  end

end