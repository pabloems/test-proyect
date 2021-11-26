Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Ruta nesteado con only vacío
  # para evitar duplicación de routes
  resources :users, only: [] do
    resources :appointments
  end

  resources :patients
end
