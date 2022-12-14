Rails.application.routes.draw do
  get 'follows/followings'
  get 'follows/followers'
  get 'sessions/new'

  get 'top' => "home#top"
  get 'about' => "home#about"

  get "posts" => "posts#index"
  get "posts/index" => "posts#index"
  get "posts/:id/new" => "posts#new"
  get "posts/new" => "posts#new"

  get "profile/:username" => "users#profile" #マイページ表示用 下のposts/:idより上におかないと#showに飛んでしまう
  post "profile/:username" => "users#search"

  get "posts/:id" => "posts#show"

  post "posts/create" => "posts#create"

  get "posts/:id/edit" => "posts#edit"
  patch "posts/:id/edit" => "posts#update"

  delete "posts/:id/delete" => "posts#destroy"

  get "/posts/:id/likes" => "likes#create"
  delete "/posts/:id/likes" => "likes#destroy"

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get "profile" => "users#show"
  get "/:id/profile/edit" => "users#edit" #プロフィール更新用
  patch ":id/profile/edit" => "users#update"
  get "follows/followings/:username" => "follows#followings", as: 'followings'
  get "follows/followers/:username" => "follows#followers", as: 'followers'
  delete "unsubscribe" => "users#destroy"

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"

  get "/search/index" => "searches#index"

  resources :users do
    resource :follows, only: [:create, :destroy]
    get 'followings' => 'follows#followings', as: 'followings'
    get 'followers' => 'follows#followers', as: 'followers'
  end

  resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resource :likes, only: [:create, :destroy]
    post "/posts/:post_id/likes" => "likes#create"
    delete "/posts/:post_id/likes" => "likes#destroy"
  end

  resources :posts, only: [:new] do
    get "new/" => "posts#new"
  end
end
