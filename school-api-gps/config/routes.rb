Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  namespace :api do
    namespace :v1 do
      resources :institutions, only: [ :index, :show ] do
        # List all students for a specific institution:
        get "students", on: :member
      end

      # Only include the student show endpoint here:
      resources :students, only: [ :show ] do
        # This endpoint will return all enrollments for a given student.
        get "enrollments", on: :member
      end

      # Optionally, include endpoints for courses, etc.
      resources :courses, only: [ :index, :show ] do
        get "students", on: :member
      end

      # Enrollment details endpoint:
      resources :enrollments, only: [ :show ]

      # Statistics endpoint:
      get "stats", to: "stats#index"
    end
  end
end
