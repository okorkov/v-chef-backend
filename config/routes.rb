Rails.application.routes.draw do

  root 'admin#index'
  
  resources :admin, only: [:index] do 
    resources :blogs
    resources :contents
  end

  resources :sessions, only: [:new, :create]

  post '/sessions/:id' => 'sessions#destroy', :as => 'sessions_destroy'

end
