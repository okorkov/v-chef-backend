Rails.application.routes.draw do

  root 'admin#index'
  get  '/admin/:id/blogs/new' => 'blogs#new', :as => 'new_blog'
  get  '/admin/:id/blogs/:blog_id/edit' => 'blogs#edit', :as => 'edit_admin_blog'
  post '/admin/:id/blogs/:blog_id/update' => 'blogs#update', :as => 'update_admin_blog'
  post '/admin/:id/blogs/:blog_id/destroy' => 'blogs#destroy', :as => 'destroy_admin_blog'
  post '/admin/:id/contents/:content_id/' => 'contents#destroy', :as => 'destroy_admin_content'

  resources :admin, only: [:index] do 
    resources :blogs
  end

  resources :sessions, only: [:new, :create]

  post '/sessions/:id' => 'sessions#destroy', :as => 'sessions_destroy'
end
