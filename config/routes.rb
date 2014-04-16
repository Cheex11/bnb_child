Airbnbchild::Application.routes.draw do

  root to: "users#index"
  devise_for :users
  resources :users, :only => [:show, :index]
  resources :listings do
    resources :images, :only => [:new, :create]
  end
  resources :images, :except => [:new, :create]
end
