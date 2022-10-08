Rails.application.routes.draw do
  get 'follows/followings'
  get 'follows/followers'
  get 'sessions/new'

  get 'top' => "home#top"
  get 'about' => "home#about"

  get "posts" => "posts#index"
  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"

  get "posts/:username/profile" => "posts#profile" #マイページ表示用 下のposts/:idより上におかないと#showに飛んでしまう

  get "posts/:id" => "posts#show"

  post "posts/create" => "posts#create"

  get "posts/:id/edit" => "posts#edit"
  patch "posts/:id/edit" => "posts#update"

  get "posts/:id/delete" => "posts#destroy"

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get "profile" => "users#show"
  get "/:username/profile/edit" => "users#edit" #プロフィール更新用
  patch ":username/profile/edit" => "users#update"
  delete "unsubscribe" => "users#destroy"

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"

  resources :users do
    resource :follows, only: [:create, :destroy]
    get 'followings' => 'follows#followings', as: 'followings'
    get 'followers' => 'follows#followers', as: 'followers'
  end

end
