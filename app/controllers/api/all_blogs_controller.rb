class Api::AllBlogsController < ActionController::Base

  def all_blogs
    blogs = Blog.published
    render json: blogs, except: [:user_id, :status], include: [:contents => {except: [:created_at, :updated_at, :blog_id]}]
  end
  
end