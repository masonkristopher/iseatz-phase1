Rails.application.routes.draw do

  get 'menus/index'
  # cuisines endpoint for GET requests by city
  resources :cuisines, only: :index

  # menus endpoint for GET requests by city and cuisine
  resources :menus, only: :index

end
