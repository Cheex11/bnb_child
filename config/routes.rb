Airbnbchild::Application.routes.draw do

  root to: "listings#index"
  devise_for :users
  resources :users, :only => [:show, :index]
  resources :listings do
    resources :images, :only => [:index, :create, :destroy]
  end
end
