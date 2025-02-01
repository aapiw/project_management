Rails.application.routes.draw do
  get 'react/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  concern :api_routes do |options|
    post "/auth/login", to: "authentication#login"

    namespace :admin do
      resources :users, only: [:index]
      resources :projects, only: [:index] do
        member do
          post :assign_users
          post :unassign_users
        end
      end
    end

    namespace :user do
      resources :tasks, only: [:index]
      resources :projects, only: [:index] do
        member do
          post :assign_tasks
          post :unassign_tasks
        end
      end
    end

  end
  namespace :api, defaults: { format: "json"} do 
    namespace :v100, path: "v1.0.0" do
      concerns :api_routes
    end
  end

  root "react#index"
  
  # React fallback route
  get '*path', to: 'react#index', constraints: ->(req) { !req.xhr? && req.format.html? }
  
end
