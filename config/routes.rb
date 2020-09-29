Rails.application.routes.draw do
  devise_for :users
  resources :countries, only: [:index,:show] do
    resources :events do
      resources :user_events, only: :create
    end
    resources :articles
    resources :questions do
      resources :answers, only: [:new, :create]
    end
  end
  resources :users, only: :show
  root to: "countries#index"
end
