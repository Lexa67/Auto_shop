Rails.application.routes.draw do
  devise_for :users

  scope '/admin' do
    resources :users
  end

  root "autos#index"

  resources :roles
  resources :autos
  resources :cars
end
