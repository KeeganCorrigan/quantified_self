Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :foods
      resources :meals, only: [:index] do
        post "/foods/:id", to: "meals/foods#create"
        resources :foods, only: [:index], to: "meals/foods#index"
        resources :foods, only: [:create], to: "meals/foods#create"
      end
    end
  end
end
