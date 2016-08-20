Rails.application.routes.draw do
  resources :blogs do
    member do 
      post :publish, :unpublish
    end 
  end

  get 'password_resets/new'
  get 'password_resets/edit'

  resources :tours do
  	resources :tourcomments
    
    match 'pick_member' => 'tours#pick_member', as: 'pick_member', via: [:get]
  end
  
  match 'ratetour' => 'tours#rate', as: 'ratetour', via: [:post]
  match 'join_request' => 'tours#join_request', as: 'join_request', via: [:post]
  match 'cancel_request' => 'tours#cancel_request', as: 'cancel_request', via: [:post]
  match 'my_tours' => 'tours#my_tours', as: 'my_tours', via: [:get]

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
