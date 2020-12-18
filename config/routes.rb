Rails.application.routes.draw do
  #write custom routes up top to avoid issues

  get '/signup' => 'users#new'
  
  resources :reviews
  resources :movies
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
