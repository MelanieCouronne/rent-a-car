Rails.application.routes.draw do
  get 'users/profile'
  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }
  root to: 'pages#home'

  get 'search', to: "rides#index"

  resources :rides, only: [:index, :new, :create, :show, :destroy] do
    resources :reservations, only: [:new, :create, :destroy]
  end

end
