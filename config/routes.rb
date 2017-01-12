Rails.application.routes.draw do
  resources :puddles
  resources :passengers
  resources :drivers
  resources :profiles
  resources :users do
    resources :cars
  end
  resources :companies
  resources :locations

  root :to => 'site#index'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'
  post 'puddles/:id/add_passenger', to: 'puddles#add_passenger', as: 'add_passenger'
  post 'puddles/:id/remove_passenger', to: 'puddles#remove_passenger', as: 'remove_passenger'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
