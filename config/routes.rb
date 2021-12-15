Rails.application.routes.draw do
  get 'users/profile'
  devise_for :users, controllers: { registrations: 'users/registrations'}
  root to: 'rides#index'

  get 'search', to: "rides#index"

  resources :rides, only: [:index, :new, :create, :show, :destroy], shallow: true do
    resources :reservations, only: [:index, :new, :create, :show]
  end

  resources :reservations, only: [:destroy]

  resources :users, only: [] do
    member do
      get :my_rides
      get :my_reservations
    end
  end

end
