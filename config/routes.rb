Rails.application.routes.draw do
  devise_for :users, 
  controllers: {registrations: 'users/registrations'}
  devise_scope :user do
    get 'favorites', to: 'users/registrations#new_favorite'
    post 'favorites', to: 'users/registrations#create_favorite'
  end
  root to: "posts#index"

  resources :favorites, only: [:edit, :update]

  resources :users, only: [:show]

  resources :posts, only: [:index, :new, :create, :show, :destroy] do
    resources :photos, only: [:create]
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

end
