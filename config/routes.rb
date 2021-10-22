require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  
  mount Sidekiq::Web => '/sidekiq'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "pages#index"
  get "/404", to:"pages#not_found"
  get "/:slug", to: "pages#show"
end
