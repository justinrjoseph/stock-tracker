Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'user/registrations' }
  resources :user_stocks, except: [:show, :edit, :update]
  resources :users, only: :show
  resources :friendships, only: :destroy
  
  root 'welcome#index'
  get 'search_stocks', to: 'stocks#search'
  get 'my_portfolio', to: 'users#my_portfolio'
  
  get 'search_friends', to: 'users#search'
  post 'add_friend', to: 'users#add_friend'
  get 'my_friends', to: 'users#friends'
end
