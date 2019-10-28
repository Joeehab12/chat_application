Rails.application.routes.draw do
  resources :messages
  resources :chats
  resources :applications
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resource :application
  resource :chat
  get '/applications' => 'applications#index'
  get '/applications/:token' => 'applications#show'
  post '/applications' => 'applications#create'
  put '/applications/:token' => 'applications#update'

  get '/applications/:token/chats' => 'chats#index'
  get '/applications/:token/chats/:id' => 'chats#show'
  post '/applications/:token/chats' => 'chats#create'
  put '/applications/:token/chats/:id' => 'chats#update'

  get '/applications/:token/chats/:id/messages' => 'messages#index'
  get '/applications/:token/chats/:id/messages/:msg_id' => 'messages#show'
  post '/applications/:token/chats/:id/messages' => 'messages#create'
  post '/applications/:token/chats/:id/messages/:query' => 'messages#retrieve'
  put '/applications/:token/chats/:id/messages/:msg_id' => 'messages#update'
end
