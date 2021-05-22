class Api::AllBlogsController < ApplicationController

  def all_blogs
    blogs = Blog.published
    render json: blogs, except: [:user_id, :status] #, include: [:contents => {except: [:created_at, :updated_at, :blog_id]}]
  end

  def show_blog
    render_single_blog(params)
  end

  def lifestyle
    blogs = Blog.lifestyle
    render json: blogs, except: [:user_id, :status]
  end

  def show_lifestyle
    render_single_blog(params)
  end

  def cooking 
    blogs = Blog.cooking
    render json: blogs, except: [:user_id, :status]
  end

  def show_cooking
    render_single_blog(params)
  end
  
end