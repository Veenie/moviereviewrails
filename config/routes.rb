Rails.application.routes.draw do
  #write custom routes up top to avoid issues

  root 'sessions#home'

  #sign up
  get '/signup' => 'users#new'


  #log out
  delete '/logout' => 'sessions#delete'
  
  resources :reviews
  resources :movies
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
