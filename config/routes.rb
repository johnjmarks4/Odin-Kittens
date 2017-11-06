Rails.application.routes.draw do
  get 'kittens/new'

  get 'kittens/create'

  post 'kittens/create' => 'kittens#create'

  post 'kittens' => 'kittens#create'

  get 'kittens/show' => 'kittens#show'

  post 'kittens/show' => 'kittens#show'

  post 'kittens/destroy' => 'kittens#destroy'

  get 'kittens/edit'

  post 'kittens/edit'

  patch 'kittens' => 'kittens#update'

  root "kittens#index"
end
