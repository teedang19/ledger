Rails.application.routes.draw do
  
  devise_for :users, path: ''
  mount Sidekiq::Web => '/sidekiq'
  
  root 'static_pages#home'

end
