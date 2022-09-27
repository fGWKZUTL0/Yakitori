Rails.application.routes.draw do

  get 'top' => "home#top"
  get 'about' => "home#about"

  get "posts" => "posts#index"
  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"
  get "posts/:id" => "posts#show"

  post "posts/create" => "posts#create"

  get "posts/:id/edit" => "posts#edit"
  patch "posts/:id/edit" => "posts#update"

  get "posts/:id/delete" => "posts#destroy"

  get "accounts/signup" => "accounts#new"
  post "accounts/signup" => "accounts#create"

  get "accounts/sign_in" => "accounts#sign_in"
  post "accounts/sign_in_process" => "accounts#sign_in_process"

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'profile'
  delete '/users/:id', to: 'users#destroy', as: 'unsubscribe'
end
