Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resource :feed
  resources :users, only: :index
  
  root 'feed#index'

  get 'friends', to: 'users#friends'
  get 'invite/:id', to: 'users#invite', as: 'invite'
  get 'friend_requests', to: 'users#friend_requests'
  delete 'delete_request/:id', to: 'users#delete_request', as: 'delete_request'

end
