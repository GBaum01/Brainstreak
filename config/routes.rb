Rails.application.routes.draw do
  root "pages#home"

  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]

  resources :users do
    resources :students
  end

  get "family", to: "family#index"

  get "up" => "rails/health#show", as: :rails_health_check
end
