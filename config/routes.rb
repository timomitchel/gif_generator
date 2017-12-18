Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"

    namespace :admin do 
      resources :gifs, only: [:show, :new, :create, :destroy]
      resources :categories, only: [:show, :new, :create, :destroy]
      resources :users, only: [:new, :create]
    end


  resources :gifs, only: [:index]
  resources :users, only: [:show, :new, :create]
end
