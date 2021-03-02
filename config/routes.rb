Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  match '/auth/:google_oauth2/callback' => 'sessions#google', via: [:get,:post]
  root to: 'sessions#welcome'
  
  post '/signup' => 'users#create'
  get '/signup' => 'sessions#new'
  
  get '/login', to: 'sessionss#new'
  #post '/login', to: 'users#create'
  get '/logout', to: 'sessions#destroy'
  
  
  resources :games do 
    collection do     
      get 'recent_games', as: 'recent_games'
    end
  end
  resources :users

  resources :games do
    resources :comments
  end

  resources :sessions

  resources :games 
  
  resources :comments
  
  
  # resources :games do
  #   resources :comments
  # end

end
