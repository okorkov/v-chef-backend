Rails.application.routes.draw do

  root 'admin#index'
  get  '/admin/:id/blogs/new' => 'blogs#new', :as => 'new_blog'
  get  '/admin/:id/blogs/:blog_id/edit' => 'blogs#edit', :as => 'edit_admin_blog'
  post '/admin/:id/blogs/:blog_id/update' => 'blogs#update', :as => 'update_admin_blog'
  post '/admin/:id/blogs/:blog_id/destroy' => 'blogs#destroy', :as => 'destroy_admin_blog'
  get '/admin/:id/blogs/:blog_id/contents/:content_id/destroy' => 'contents#destroy', :as => 'destroy_admin_content'
  get  '/admin/:id/blogs/published' => 'blogs#published', :as => 'admin_blogs_published'
  get  '/admin/:id/blogs/drafts' => 'blogs#drafts', :as => 'admin_blogs_drafts'

  resources :admin, only: [:index] do 
    resources :blogs
  end

  resources :sessions, only: [:new, :create]

  post '/sessions/:id' => 'sessions#destroy', :as => 'sessions_destroy'

  # API

  namespace :api do
    get '/all_blogs' => 'all_blogs#all_blogs'
    get '/all_blogs/:id' => 'all_blogs#show_blog'
    get '/lifestyle/' => 'all_blogs#lifestyle'
    get '/lifestyle/:id' => 'all_blogs#show_lifestyle'
    get '/cooking/' => 'all_blogs#cooking'
    get '/cooking/:id' => 'all_blogs#show_cooking'
  end

end
