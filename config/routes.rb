Rails.application.routes.draw do
  get 'tasks/index'
  get 'tasks/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  # Read all my tasks
  get "/tasks", to: "tasks#index", as: :tasks

  # Create a task in 2 steps: 1 action for form / 1 action to create the instance
  # one page just for the form itself
  get "/tasks/new", to: "tasks#new", as: :new_task
  # this action is just to create the instance ()
  post "/tasks", to: "tasks#create"

  # one page just for the form itself
  get "/tasks/:id/edit", to: "tasks#edit", as: :update_task
  # this action is just to update the instance
  patch "/tasks/:id", to: "tasks#update", as: :task # why is as: :task above the other routes below?

  # delete a task
  delete "/tasks/:id", to: "tasks#destroy"


  # Read one of my tasks
  # /tasks/1
  get "/tasks/:id", to: "tasks#show"
end
