Rails.application.routes.draw do
  #write custom routes up top to avoid issues

  root 'sessions#home'

  #sign up
  get '/signup' => 'users#new'

  #login
  get '/login' => 'sessions#new'
  post 'login' => 'sessions#create'

  #google login

  #match '/auth/github/callback', to: 'sessions#g_login', via: [:get, :post]

  get '/auth/facebook/callback', to: 'sessions#g_login'


  #log out
  delete '/logout' => 'sessions#destroy'
  
  
  resources :reviews

  resources :users do
    resources :reviews, shallow: true
  end  

  resources :movies do
    resources :reviews, only: [:index, :show]
  end
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
