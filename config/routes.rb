Rails.application.routes.draw do

  resources :messages
  resources :users

  post '/login'           => 'sessions#create'
  post '/signup'          => 'users#create'
  post '/timeline'        => 'messages#timeline'
  post '/follow/:user_id' => 'users#follow'
  get  '/user_list'       => 'users#index'
  post '/messages_index'  => 'users#show'
  post '/message'         => 'messages#create' #=> Post a tweet

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html





end
