Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :foods
      resources :meals, only: [:index] do
        resources :foods, only: [:index], to: "meals/foods#index" do
        end
      end
    end
  end
end
