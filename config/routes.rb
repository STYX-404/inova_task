# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => "/api-docs"
  mount Rswag::Api::Engine => "/api-docs"

  namespace :v1 do
    resources :users, module: :user, only: %i() do
      resources :reviews, only: %i(create)
      resources :posts, only: %i(index create) do
      end
    end
    resources :top_posts, only: %i(index)
  end
end
