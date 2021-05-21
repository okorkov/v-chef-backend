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
  end

  def destroy
  end
end

 hash = 
 {"blog"=>
  {":title"=>"title",
   ":subtitle"=>"subtitle",
   ":hero_image"=>"herolink",
   ":contents"=>
    {"t"=>"Initial text",
     "t0.5779491471223361"=>"Second Line of Text here",
     "i0.6388764074943005"=>"Image Link",
     "v0.1496596439558211"=>"Video Link",
     "t0.2467319643854946"=>"And Finish off with some text again"},
   ":status"=>"published"},
 "admin_id"=>"1"}