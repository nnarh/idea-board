Rails.application.routes.draw do
  devise_for :users
  # devise_for :users, controllers: {
  #   sessions: 'sessions'

  # }
#devise_for :users, controllers: { sessions: "users/sessions" }
  #devise_for :users, path_names: {sign_in: "login", sign_out: "logout", sessions: "users/sessions"}#, controllers: { sessions: "users/sessions" }
  # devise_for :users
  #root "search_results#show"

  root "homes#show", as: :landing

  get '/about' => 'pages#about'
  get '/privacy' => 'pages#privacy'
  get '/terms' => 'pages#terms'

  #resources :session
  #resource :session, only: [:new, :create, :destroy]
  #resources :users, only: [:new, :create, :show]
  namespace :admin do
    get "", to: "dashboard#index", as: "/"
    resources :users, only:[:index, :show, :update]
  end

  resources :ideas, only: [:index, :show, :create, :destroy] do
    member do
      post "join" => "idea_memberships#create"
      delete "leave" => "idea_memberships#destroy"
    end
    resources :comments, only: [:create]
  end

  resources :groups, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :ideas, only: [:new, :create]
    member do
      post "join" => "group_memberships#create"
      delete "leave" => "group_memberships#destroy"
    end
  end

  get "search" => "search_results#show"
end
