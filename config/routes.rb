require "monban/constraints/signed_in"
require "monban/constraints/signed_out"

Rails.application.routes.draw do
  constraints Monban::Constraints::SignedIn.new do
    root "ideas#new"
  end

  constraints Monban::Constraints::SignedOut.new do
    root "sessions#new", as: :landing
  end

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  resources :ideas, only: [:new, :create, :show]
  resources :groups, only: [:index, :new, :create, :show] do
    member do
      post "join" => "group_memberships#create"
    end
  end

  get "search" => "search_results#show"
end
