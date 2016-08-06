Rails.application.routes.draw do
  resources :users
  root "welcome#index"
  
  resources :sessions, only: [:new, :create]
  match 'logout' => 'sessions#destroy', as: 'logout', via: [:get, :post]
end
