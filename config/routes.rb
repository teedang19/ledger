require 'sidekiq/web'

Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  root 'static_pages#home'

  devise_for :users, path: ''

  resources :accounts
  
  mount Sidekiq::Web => '/sidekiq'  
end
