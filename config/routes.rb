Airbnbchild::Application.routes.draw do

  resources :events

  match '/calendar(/:year(/:month))' => 'calendar#index', via: [:get, :post], :as => :calendar, :constraints => {:year => /\d{4}/, :month => /\d{1,2}/}
  root to: "listings#index"
  devise_for :users
  resources :users, :only => [:show, :index]
  resources :listings do
    resources :images, :only => [:index, :create, :destroy]
  end
end
