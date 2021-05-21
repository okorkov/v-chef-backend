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
      if key[0] == 't' 
        blog.contents << Content.create(content_type: 'text', value: value)
      elsif key[0] == 'i' 
        blog.contents << Content.create(content_type: 'image', value: value)
      elsif key[0] == 'v'
        blog.contents << Content.create(content_type: 'video', value: "https://www.youtube.com/embed/" + value)
      end
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
    raise params.inspect
  end

  def destroy
    Blog.find_by_id(params[:blog_id]).destroy
    redirect_to admin_blogs_path(@admin)
  end

end
