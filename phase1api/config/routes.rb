Rails.application.routes.draw do

  # cuisines endpoint for GET requests
  resources :cuisines, only: :index

end
