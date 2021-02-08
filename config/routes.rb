Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

get '/signup' => 'users#new'
post '/signup' => 'users#create'

get '/login' => 'sessions#new'
post '/login' => 'sessions#create'
delete '/logout' => 'sessions#destroy'


resources :users do
  resources :games
end
resources :games 

resources :comments
resources :users


end
