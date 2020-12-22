Rails.application.routes.draw do
  #write custom routes up top to avoid issues

  root 'sessions#home'

  #sign up
  get '/signup' => 'users#new'

  #login
  get '/login' => 'sessions#new'
  post 'login' => 'sessions#create'


  #log out
  delete '/logout' => 'sessions#destroy'
  
  
  resources :reviews

  resources :users do
    resources :reviews
  end  

  resources :movies do
    resources :reviews, only: [:new, :create, :index, :show]
  end
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
