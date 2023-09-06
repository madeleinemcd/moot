Rails.application.routes.draw do
  get 'welcome/index'
  devise_for :authors
  devise_for :admins
  devise_for :readers
  root to: "pages#home"
  get "about", to: "pages#about"
  get "contact", to: "pages#contact"

  resources :reviews, except: [:destroy] do
    resources :comments, only: [:new, :create, :destroy]
  end
end



# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # resources :conversations, only: [:create, :show, :index] do
  #   resources :messages, only: :create
  # end

  # Defines the root path route ("/")
  # root "articles#index"
