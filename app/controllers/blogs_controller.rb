class BlogsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find_by(params[:id])
  end

  def new
    @blog = Blog.new
  end

  def create
    raise params.inspect
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
