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

end
