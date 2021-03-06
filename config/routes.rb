Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  as :user do
   get 'users/profile', :to => 'devise/registrations#edit', :as => :user_root
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users 
  resources :profiles


  resources :posts do
   resources :likes
   resources :comments
  end
  
  resources :comments
  
  root 'posts#index'

  get 'friends', to: 'users#friends'
  get 'invite/:id', to: 'users#invite', as: 'invite'
  get 'friend_requests', to: 'users#friend_requests'
  delete 'delete_request/:id', to: 'users#delete_request', as: 'delete_request'
  put 'accept_request/:id/accept', to: 'users#accept_request', as: 'accept_request'
  put 'unfriend/:id', to: 'users#unfriend', as: 'unfriend'



end
