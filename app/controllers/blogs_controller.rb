class BlogsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find_by_id(params[:id])
    if !@blog
      redirect_to admin_blogs_path(@admin)
    end
  end

  def new
    @blog = Blog.new
  end

  def create
    blog = Blog.new(title: params[:blog][:title], subtitle: params[:blog][:subtitle], hero_image: params[:blog][:hero_image], user_id: @admin.id)
    blog.status = 'published' if params[:blog][:status]
    blog.publish_date = Time.now if params[:blog][:status]
   
    params[:blog][:contents].each do |key, value|
      create_content_from_hash(key, value,blog)
    end
     blog.save
     redirect_to admin_blogs_path(@admin)
  end

  def edit
    @blog = Blog.find_by_id(params[:blog_id])
    if !@blog
      redirect_to admin_blogs_path(@admin)
    end
  end

  def update
    blog = Blog.find_by_id(params[:blog_id])
    blog.update(update_params)
    blog.status = 'draft' if params[:blog][:status].nil?
    blog.save
    params[:blog][:contents].each do |key, value|
      c = Content.find_by_id(key)
      if c
        c.value = value
        c.save
      else
        create_content_from_hash(key, value, blog)
      end
    end
    redirect_to admin_blog_path(@admin, blog)
  end

  def destroy
    Blog.find_by_id(params[:blog_id]).destroy
    redirect_to admin_blogs_path(@admin)
  end

  def drafts
    @blogs = Blog.drafts
    render :index
  end

  def published
    @blogs = Blog.published
    render :index
  end

  private

  def update_params
    params.require(:blog).permit(:title, :subtitle, :hero_image, :status)
  end

end
