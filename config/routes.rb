Rails.application.routes.draw do

  resources :home

  resources :collections

  resources :paintings

  get "/about" => "home#about"
  root 'home#index'

end
