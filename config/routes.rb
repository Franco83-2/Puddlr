Rails.application.routes.draw do
  resources :puddles
  resources :passengers
  resources :drivers
  resources :profiles
  resources :users
  resources :cars
  resources :locations
  resources :companies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
