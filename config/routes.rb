Rails.application.routes.draw do
  devise_for :users
  get '/splash', to: 'splash#index', as: 'splash'

  devise_scope :user do
    authenticated :user do
      root 'groups#index', as: :authenticated_root
    end
  
    unauthenticated do
      root "splash#index", as: :unauthenticated_root
    end
  end
  
  resources :users, only: [:index, :show] do
    resources :groups, only: [:index, :show, :new, :create, :destroy] do
      resources :expenses, only: [:index, :show, :new, :create, :destroy] do
          resources :expense_groups, only: [:new, :create, :destroy]
       end
    end
  end
end
