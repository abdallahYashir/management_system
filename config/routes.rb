Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # devise_scope :user do
  #   get 'sign_in', to: 'devise/sessions#new'
  # end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
