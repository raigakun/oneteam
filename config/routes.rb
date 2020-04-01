Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'favorites', to: 'users/registrations#new_favorite'
    post 'favorites', to: 'users/registrations#create_favorite'
  end
  root to: "pages#home"

end
