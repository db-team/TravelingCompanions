Rails.application.routes.draw do
  resources :tours do
  	resources :tourcomments
    
    match 'pick_member' => 'tours#pick_member', as: 'pick_member', via: [:get]
  end
  
  match 'ratetour' => 'tours#rate', as: 'ratetour', via: [:post]
  match 'join_request' => 'tours#join_request', as: 'join_request', via: [:post]
  match 'cancel_request' => 'tours#cancel_request', as: 'cancel_request', via: [:post]
  match 'my_tours' => 'tours#my_tours', as: 'my_tours', via: [:get]

  resources :blogs
  resources :users
  root "welcome#index"
  
  resources :sessions, only: [:new, :create]
  match 'logout' => 'sessions#destroy', as: 'logout', via: [:get, :post]
end
