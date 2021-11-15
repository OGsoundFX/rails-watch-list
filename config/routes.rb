Rails.application.routes.draw do
  devise_for :users
  get 'bookmarks/new'
  get 'bookmarks/create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "lists#index"
  resources :movies, only: [:index, :show, :new, :create]
  resources :lists do
    resources :bookmarks, only: [:new, :create]
  end
end
