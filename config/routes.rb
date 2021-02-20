Rails.application.routes.draw do
  match '/auth/:provider/callback' => 'sessions#omniauth', via: [:get,:post]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root to: 'sessions#welcome'

  get '/signup' => 'sessions#new'
  post '/signup' => 'sessions#create'

  get '/login', to: 'users#new'
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
