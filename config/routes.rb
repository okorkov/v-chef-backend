Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :admin, only: [:index] do 
    resources :blogs
    resources :contents
  end

  resources :sessions, only: [:new, :create, :destroy]

  post '/sessions/:id' => 'sessions#destroy', :as => 'sessions_destroy'

end
