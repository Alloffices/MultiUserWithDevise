Rails.application.routes.draw do
  post 'contributions/create'

  post 'contributions/destroy'
  resources :contributions
  devise_for :users

  resources :posts do 
  	member do
  		get "like", to: "posts#upvote"
  		get "dislike", to: "posts#downvote"
  	end
    resources :comments
  end

  root "posts#index"

  resources :searches
end
