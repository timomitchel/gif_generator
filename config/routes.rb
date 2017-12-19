Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"

    namespace :admin do 
      resources :categories, only: [:index, :show, :new, :create, :destroy] 
      resources :gifs, only: [:new, :create, :destroy]
      resources :users, only: [:show, :new, :create]
    end

    resources :users, only: [:new, :create]
    resources :gifs, only: [:index]
    resources :favorites, only: [:create, :destroy, :index]
end
