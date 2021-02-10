Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root to: 'sessions#welcome'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  

  resources :users do
    resources :games, only: [:show]
  end

  resources :sessions

  resources :games 
  
  resources :comments
  
  # resources :games do
  #   resources :comments
  # end

end
