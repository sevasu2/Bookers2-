Rails.application.routes.draw do


  root 'roots#index'

  get '/roots/about', to: 'roots#about', as: 'about'

  devise_for :users

  resources :books

  resources :users, only: [:index, :show, :update, :edit]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
