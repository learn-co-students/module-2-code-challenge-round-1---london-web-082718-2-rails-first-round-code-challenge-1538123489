Rails.application.routes.draw do


  resources :powers
  resources :heroines

  # #Powers
  # resources :powers, only: [:index]
  # get "/powers/:id/", to: "powers#show", as: "power"
  #
  # #heroines
  # resources :heroines, only: [:index, :new]
  # get "/heroines/:id/", to: "heroiness#show", as: "heroine"
  #



end
