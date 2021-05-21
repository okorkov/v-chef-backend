# This file is used by Rack-based servers to start the application.

require_relative "config/environment"

run Rails.application
Rails.application.load_server


require ::File.expand_path('../config/environment',  __FILE__)
run Rails.application

require 'rack/cors'
use Rack::Cors do

  # allow all origins in development
  allow do
    origins 'https://v-chef.web.app/', 'http://localhost:3001'
    resource '*', 
        :headers => :any, 
        :methods => [:get]
  end
end