Rails.application.routes.draw do
  devise_for :users
  root to: 'appointments#quote'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Ruta nesteado con only vacío
  # para evitar duplicación de routes
  resources :users, only: [] do
    resources :appointments, only: %i[index new create edit update destroy]
    get 'quote', to: "appointments#quote"
  end

  resources :patients
end
