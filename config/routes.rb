Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :favorite_foods, only: [:index]
      resources :foods
      resources :meals, only: [:index] do
        post "/foods/:id", to: "meals/foods#create"
        delete "foods/:id", to: "meals/foods#destroy"
        resources :foods, only: [:index], to: "meals/foods#index"
        resources :foods, only: [:create], to: "meals/foods#create"
      end
    end
  end
end
