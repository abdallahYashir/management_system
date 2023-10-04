Rails.application.routes.draw do
  get 'attendances/create'
  devise_for :users
  root 'home#index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get '*path', to: 'application#not_found', via: :all
  # authenticate :user, lambda { |u| u.admin? } do
  # end
  # devise_scope :user do
  #   get 'sign_in', to: 'devise/sessions#new'
  # end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
