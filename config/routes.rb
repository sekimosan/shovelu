Rails.application.routes.draw do
  devise_for :users 
  devise_scope :user do
    get "detail_edit", to: "users/registrations#detail_edit", as: "detail_edit"
    patch "detail_update", to: "users/registrations#detail_update", as:"detail_update"
  end
  root to: "rooms#index"
  resources :users, only: [:show] do
    collection do
      get "search"
    end
  end  
  post 'follow/:id' => 'relationships#follow', as: 'follow'
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
  resources :rooms, only: [:index,:new,:create,:show,:destroy] do
    resources :topics, only: [:index,:create,:destroy,:show] do
      resources :comments, only: [:index, :create, :destroy]
    end
  end
  
end
