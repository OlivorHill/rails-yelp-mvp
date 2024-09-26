Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"


  #### NEW WAY OF DOING ROUTES USING RESOURCES ####
  resources :restaurants, only: [ :index, :show, :new, :create ] do
    resources :reviews, only: [ :new, :create ]
  end



  #### OLD WAY OF DOING THE ROUTES ###
  # # READ
  # get "restaurants", to: "restaurants#index"

  # # CREATE (:as "new_restaurant" will allow us to redirect or create a link to "new_restaurant_path")
  # get "restaurants/new", to: "restaurants#new"

  # # CREATE
  # post "restaurants", to: "restaurants#create"

  # # READ
  # get "restaurants/:id", to: "restaurants#show", as: "restaurant"

  # # DELETE
  # delete "restaurants/:id", to: "restaurants#destroy"

  #
end
