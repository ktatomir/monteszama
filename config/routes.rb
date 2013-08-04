Monteszama::Application.routes.draw do

  resources :users
  resources :orders do
    resources :items
    resources :payments
  end
   
  root :to => 'orders#index'

end
