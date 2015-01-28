Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  root "site#index"

  get 'auth/logout' => 'auth#logout'
  get 'auth/failure' => 'auth#failure'
  get 'auth/:provider/callback' => 'auth#callback'

  get "login" => "sessions#new", as: :login
  post "login" => "sessions#create"

  get "logout" => "sessions#destroy"
  post "logout" => "sessions#destroy"

  get "about" => "site#about"

  get 'signup' => 'users#new', as: :signup
  post 'signup' => 'users#create'

  resources :users

  # get '/auth/:provider/callback', to: 'sessions#create'

  get "users/:id/goals" => "users#goals", as: :goals
  post "users/:id/goals" => "users#goals_add", as: :addgoal
  post "users/:id" => "users#goals"

  get "users/:id/goals/:goal_id" => "users#goalshow", as: :eachgoal

  get "users/:id/awards" => "users#awards"

  put "users/:id/goals/update" => "users#goals_update", as: "goal_update"
  put "users/update" => "users#goals_update"
  put "users/:id/goalscomplete" => "users#goals_complete", as: :goal_complete
  put "users/:id/goals/remove" => "users#goals_inactive", as: "goal_inactive"
end
