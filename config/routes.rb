Rails.application.routes.draw do
  
  root "autos#index"

  resources :autos
  resources :cars

end
