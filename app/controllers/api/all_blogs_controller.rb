class Api::AllBlogsController < ActionController::Base

  def all_blogs
    blogs = Blog.published
    render json: blogs, except: [:user_id, :status] #, include: [:contents => {except: [:created_at, :updated_at, :blog_id]}]
  end

  def show_blog
    blog = Blog.find_by_id(params[:id])
    if blog
      render json: blog, except: [:user_id, :status] , include: [:contents => {except: [:created_at, :updated_at, :blog_id]}]
    else 
      render json: {error: 'Blog Not Found'}
    end
  end
  
end