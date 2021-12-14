Rails.application.routes.draw do
  get 'users/profile'
  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }
  root to: 'pages#home'

  resources :rides, only: [:new, :create, :destroy] do
    resources :reservations, only: [:new, :create, :destroy]
  end

end
