Rails.application.routes.draw do
  resources :transfers, except: :show
  resources :transactions, except: :show
  resources :accounts
  resources :categories, except: :show
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#index"

  namespace :reports do
    resource :daily_balance, only: :show
    resource :income_by_category, only: :show
    resource :expenses_by_category, only: :show
  end
end
