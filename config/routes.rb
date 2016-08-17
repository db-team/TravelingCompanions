Rails.application.routes.draw do
  resources :blogs
  get 'password_resets/new'

  get 'password_resets/edit'

  root "welcome#index"
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :relationships,       only: [:create, :destroy]

  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  get 'tags/:tag', to: 'blogs#index', as: :tag
end
