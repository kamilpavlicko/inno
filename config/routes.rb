Rails.application.routes.draw do
  post 'filter/show'

  post 'transaction_on_accounts/index'
  get 'transaction_on_accounts/new'

  get 'transaction_on_accounts/show'

  get 'transaction_on_accounts/create'

  get 'user_login/index'
  get 'account/index'
 

  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  devise_for :users, :controllers => { :sessions => "my_sessions" }
  resources :users
  resources :accounts do
  	resources :transaction_on_accounts
  end
end
