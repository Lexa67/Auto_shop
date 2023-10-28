Rails.application.routes.draw do
  devise_for :users

  scope '/admin' do
    resources :users do
      get 'update_status', on: :member
    end
  end

  root "autos#index"

  resources :roles
  resources :autos
  resources :cars
  resources :comments
  resources :replies

end
