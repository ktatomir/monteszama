Monteszama::Application.routes.draw do

  resources :users
  resources :orders
  resources :items
  resources :payments
   
  root :to => 'orders#index'

end
