Rails.application.routes.draw do
  root to: "users#index"
  resources :users, only: [:new, :create, :show]
  resources :titles, only: [:index, :show]

  namespace :admin do
    resources :categories
    resources :titles
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
