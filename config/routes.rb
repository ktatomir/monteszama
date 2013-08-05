Monteszama::Application.routes.draw do

  get '/login' => "sessions#create", :as => :login
  get '/logout' => "sessions#destroy", :as => :logout
  resources :users
  resources :orders do
    resources :items
    resources :payments
  end
   
  root :to => 'orders#index'

end
