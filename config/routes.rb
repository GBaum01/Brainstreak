Rails.application.routes.draw do
  root "pages#home"

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

  get "family", to: "family#index"

  get "up" => "rails/health#show", as: :rails_health_check
end
