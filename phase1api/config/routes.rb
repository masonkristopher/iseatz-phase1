Rails.application.routes.draw do

  resources :cuisines, only: :index

  resources :reviews, only: :index

end
