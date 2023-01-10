Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "about", to: "pages#about"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # resources :conversations, only: [:create, :show, :index] do
  #   resources :messages, only: :create
  # end

  # Defines the root path route ("/")
  # root "articles#index"
  resources :reviews, except: [:destroy] do
    resources :comments, only: [:new, :create, :destroy]
  end
end
