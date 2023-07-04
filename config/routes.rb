Rails.application.routes.draw do
  devise_for :users

  root to: "books#home"
  resources :books, only: [:index, :show] do
    resources :meetings, only: [:show, :new, :create] do
      resources :records, only: [:create]
    end
  end

  resources :meetings, only: [:index, :edit, :update, :destroy]
  resources :records, only: [:index, :destroy]

  get 'list', to: 'books#list', as: 'list'

end
