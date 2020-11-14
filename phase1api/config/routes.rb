Rails.application.routes.draw do

  # create cuisines endpoint for GET requests
  get '/cuisines' => 'cuisines#index', :as => 'cuisines'
  # resources :cuisines, only: :index

end
