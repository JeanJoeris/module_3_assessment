Rails.application.routes.draw do
  root 'items#index'

  resources :items,  only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]

  get '/search', to: "search#index", as: 'search'
  get '/stores/:store_id', to: "search#show", as: 'store'

  namespace :api do
    namespace :v1 do
      resources :items, only: [:index, :show, :destroy, :create], defaults: {format: "json"}
    end
  end
end
