class AdminController < ApplicationController

  before_action :require_login

  def index
    @admin = current_user
  end

end