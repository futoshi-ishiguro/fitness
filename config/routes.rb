Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  
  
  
  resources :users, only: [:index, :show, :new, :create] do
    member do
      get :squats
      get :deads
    end
  end
  
  resources :records, only: [:create, :destroy]
end
