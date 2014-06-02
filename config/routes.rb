AnythingIsFine::Application.routes.draw do
  resources :gifts
  root :to => 'gifts#index'

  post '/gifts/:id', to: 'gifts#update'

  get '/gifts/:id', to: 'gifts#index'

  get '/gifts/:id/delete', to: 'gifts#destroy'

  get '/gifts/sort_by/:sort_by', to: 'gifts#index'

end
