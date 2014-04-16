Airbnbchild::Application.routes.draw do

  root to: "users#index"
  devise_for :users
  resources :users, :only => [:show, :index]
  resources :listings
end
