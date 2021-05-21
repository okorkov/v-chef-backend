Rails.application.routes.draw do

  root 'admin#index'
  get  '/admin/:id/blogs/new' => 'blogs#new', :as => 'new_blog'
  get  '/admin/:id/blogs/:blog_id/edit' => 'blogs#edit', :as => 'edit_admin_blog'

  resources :admin, only: [:index] do 
    resources :blogs
    resources :contents
  end

  resources :sessions, only: [:new, :create]

  post '/sessions/:id' => 'sessions#destroy', :as => 'sessions_destroy'
end
