Rails.application.routes.draw do
  resources :transfers
  resources :accounts
  devise_for :users
  root to: 'transfers#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # devise_scope :user do
  #   root to: "devise/sessions#new"
  # end
end
