Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  resources :users, only: [:edit,:update,:show] do
    collection do
      get "search"
    end
  end  
  post 'follow/:id' => 'relationships#follow', as: 'follow'
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
  resources :rooms, only: [:index,:new,:create,:show,:destroy] do
    resources :topics, only: [:index,:create,:destroy,:show]
  end
  
end
