Rails.application.routes.draw do
  get 'kittens/new'

  get 'kittens/create'

  get 'kittens/show' => 'kittens#show'

  post 'kittens/show' => 'kittens#show'

  post 'kittens/destroy' => 'kittens#destroy'

  get 'kittens/edit'

  get 'kittens/update'

  root "kittens#index"
end
