Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  resources :countries, only: [:index,:show]
  resources :events do
    resources :user_events, only: :create
    resources :event_comments, only: [:new, :create]
    collection do
      get 'search'
    end
  end
  resources :articles do
    resources :comments, only: [:new, :create]
    collection do
      get 'search'
    end
  end
  resources :questions do
    resources :answers, only: [:new, :create]
    collection do
      get 'search'
    end
  end
  resources :users, only: [:show, :edit, :update]
  resources :follow_relationships, only: [:create, :destroy]

  root to: "countries#index"
end
