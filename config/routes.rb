Rails.application.routes.draw do
  root "pages#home"

  resources :users, only: [:new, :create] do
    resources :students, only: [ :new, :create, :destroy ]
  end

  resources :students, only: [:show] do
    resources :practices, only: [:create]
  end

  resource :session, only: [:new, :create, :destroy]
  resources :questions, only: [ :show ]

  get "family", to: "family#index"
  get "up" => "rails/health#show", as: :rails_health_check
end
