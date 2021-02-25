Rails.application.routes.draw do
  get 'reviews/edit'
  get 'reviews/new'
  get 'edit/new'
  resources :properties do
    resources :bookings, only: :create
  end
  resources :bookings, except: [:new, :create]
  devise_for :users
  root to: "pages#home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "users/:user_id/bookings", to: "bookings#users_index", as: :user_bookings
  get "users/:user_id/properties", to: "properties#users_index", as: :user_properties
end
