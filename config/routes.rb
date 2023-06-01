Rails.application.routes.draw do
  devise_for :users
  get '/splash', to: 'splash#index', as: 'splash'

  devise_scope :user do
    authenticated :user do
      root 'users#index', as: :authenticated_root
    end
  
    unauthenticated do
      root "splash#index", as: :unauthenticated_root
    end
  end
  
  resources :users
end
