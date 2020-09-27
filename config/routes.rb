Rails.application.routes.draw do
  devise_for :users
  resources :countries, only: :index
  resources :users, only: :show
  root to: "countries#index"

end
