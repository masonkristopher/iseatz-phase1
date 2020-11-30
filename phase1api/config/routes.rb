# frozen_string_literal: true

Rails.application.routes.draw do
  # Swagger API docs
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  # API namespace and routes
  namespace :api do
    resources :cuisines, only: :index
    resources :reviews, only: :index
  end
end
