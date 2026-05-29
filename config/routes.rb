Rails.application.routes.draw do
  root "pages#home"

  resources :users, only: [:new, :create, :edit, :update] do
    resources :students, only: [ :new, :create, :destroy, :edit, :update ]
  end


  resources :students, only: [:show]
  resources :levels, only: [] do
    resources :practices, only: [:create]
  end

  resource :session, only: [:new, :create, :destroy]
  resources :questions, only: [ :show ] do
    member do
      post :answer
    end
  end
  resources :practices, only: [:show] do
    member do
      post :submit
      get :recap
    end
    resource :lesson, only: [:show, :create, :update]
  end

  get "family", to: "family#index"
  get "up" => "rails/health#show", as: :rails_health_check
end
