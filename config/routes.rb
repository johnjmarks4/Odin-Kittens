Rails.application.routes.draw do
  get 'kittens/new'

  get 'kittens/create'

  get 'kittens/shoe'

  get 'kittens/edit'

  get 'kittens/update'

  root "kittens#index"
end
