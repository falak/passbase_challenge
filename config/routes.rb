Rails.application.routes.draw do
  resources :transfers, only: [:new, :index, :create,:show]
  resources :accounts, only: [:index,:show]
  devise_for :users
  root to: 'transfers#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # devise_scope :user do
  #   root to: "devise/sessions#new"
  # end
end
