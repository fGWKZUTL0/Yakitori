Rails.application.routes.draw do
  get 'sessions/new'

  get 'top' => "home#top"
  get 'about' => "home#about"

  get "posts" => "posts#index"
  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"

  get "posts/mypage" => "posts#mypage" #マイページ表示用 下のposts/:idより上におかないと#showに飛んでしまう

  get "posts/:id" => "posts#show"

  post "posts/create" => "posts#create"

  get "posts/:id/edit" => "posts#edit"
  patch "posts/:id/edit" => "posts#update"

  get "posts/:id/delete" => "posts#destroy"

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get "profile" => "users#show"
  delete "unsubscribe" => "users#destroy"

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"

end
