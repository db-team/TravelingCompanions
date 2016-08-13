Rails.application.routes.draw do
  resources :tours do
  	resources :tourcomments
  end
  
  match 'ratetour' => 'tours#rate', as: 'ratetour', via: [:post]

  resources :blogs
  resources :users
  root "welcome#index"
  
  resources :sessions, only: [:new, :create]
  match 'logout' => 'sessions#destroy', as: 'logout', via: [:get, :post]
end
