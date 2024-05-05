# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :v1 do
    resources :users, only: %i() do
      resources :reviews, only: %i(create)
      resources :posts, only: %i(index create)
    end

    resources :posts, only: %i(index)
  end
end
