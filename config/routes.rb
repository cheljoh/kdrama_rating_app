Rails.application.routes.draw do
  root to: "users#index"
  resources :users, only: [:new, :create, :show]
  resources :titles, only: [:index, :show] do
    resources :ratings, only: [:new, :create, :show]
  end
  resources :categories, only: [:index, :show]

  namespace :admin do
    get '', to: 'dashboard#index', as: '/'
    resources :categories
    resources :titles
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
