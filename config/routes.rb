Rails.application.routes.draw do

  resources :messages
  resources :users do
    resources :messages, only: [:index]
  end


  post '/login'           => 'sessions#create'
  post '/signup'          => 'users#create'
  get  '/timeline'        => 'messages#index'
  post '/follow/:user_id' => 'users#follow'
  get  '/user_list'       => 'users#index'
  post '/messages_index'  => 'users#show'
  post '/message'         => 'messages#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html





end
