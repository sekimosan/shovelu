Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  resources :users, only: [:edit,:update,:show,:destroy] do
    collection do
      get "search"
    end
  end  
  resources :friends, only: [:create, :destroy]
  resources :rooms, only: [:index,:new,:create,:destory]
  
end
