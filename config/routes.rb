Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :admin, only: [:index]
  resources :sessions, only: [:new, :create, :destroy]
end
