require 'sidekiq/web'

Rails.application.routes.draw do

  root 'static_pages#home'

  devise_for :users, path: ''

  resources :accounts
  
  mount Sidekiq::Web => '/sidekiq'  
end
