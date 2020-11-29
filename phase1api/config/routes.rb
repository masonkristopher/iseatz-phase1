Rails.application.routes.draw do
  # swagger docs
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  # API namespace and routes
  namespace :api do
    resources :cuisines, only: :index
    resources :reviews, only: :index
  end
end
