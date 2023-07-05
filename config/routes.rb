Rails.application.routes.draw do
  devise_for :users

  root to: "books#home"
  resources :books, only: [:index, :show]
    resources :meetings, only: [:show, :new, :create] do
      resources :records, only: [:create]
    end

  resources :meetings, only: [:index, :edit, :update, :destroy]
  resources :records, only: [:index, :destroy]

  get 'list', to: 'books#list', as: 'list'

end
