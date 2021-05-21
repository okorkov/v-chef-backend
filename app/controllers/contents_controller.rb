class ContentsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def destroy
    Content.find_by_id(params[:content_id]).destroy
    redirect_to edit_admin_blog_path(@admin, Blog.find_by_id(params[:blog_id]))
  end

end