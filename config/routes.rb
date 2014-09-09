require "monban/constraints/signed_in"
require "monban/constraints/signed_out"

Rails.application.routes.draw do
  constraints Monban::Constraints::SignedIn.new do
    root "search_results#show"
  end

  constraints Monban::Constraints::SignedOut.new do
    root "homes#show", as: :landing
   # root "sessions#new", as: :landing
  end

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  resources :admin, only: [:new, :show, :create, :destroy]
  resources :ideas, only: [:index, :show, :create, :destroy] do
    member do
      post "join" => "idea_memberships#create"
      delete "leave" => "idea_memberships#destroy"
    end
    resources :comments
  end
  resources :groups, only: [:index, :new, :create, :show, :destroy] do
    resources :ideas, only: [:new, :create]
    member do
      post "join" => "group_memberships#create"
      delete "leave" => "group_memberships#destroy"
    end
  end

  get "search" => "search_results#show"
end
