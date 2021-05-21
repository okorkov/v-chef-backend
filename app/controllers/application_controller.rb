class ApplicationController < ActionController::Base

  layout 'application'

  include ApplicationHelper

  before_action :define_admin

end
