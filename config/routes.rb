AnythingIsFine::Application.routes.draw do
  resources :gifts
  root :to => 'gifts#index'


  # get '/scooter/new', to: 'gifts#scooternew'

  post '/gifts/:id', to: 'gifts#update'

  get '/gifts/:id/delete', to: 'gifts#destroy'

  get '/gifts/sort_by/:sort_by', to: 'gifts#index'

end
