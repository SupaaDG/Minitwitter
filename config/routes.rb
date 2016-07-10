Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'page#index'
  get '/home' => 'page#home'
  get '/register' => 'users#new'
  resources :users do
    resources :tweets
  end
  resources :tweets
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/profile' => 'users#show'
  get '/feed' => 'tweets#feed'
end
