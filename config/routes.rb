Rails.application.routes.draw do
  get "posts/index"
  get "posts/new"
  get "posts/create"
  get "posts/show"
  get "posts/edit"
  get "posts/update"
  get "posts/destroy"
  get "seats/index"
  get "seats/show"
  get "seats/new"
  get "seats/edit"
  get "seats/create"
  get "seats/update"
  get "seats/destroy"
  get "home/index"
  devise_for :users
  resources :users, except: [ :new, :create ]
  resources :seats
  resources :posts
  root to: "home#index"

  get "admin/seats", to: "seats#admin_index", as: "admin_seats"
  get "find_seat", to: "seats#find_seat"

  get "up" => "rails/health#show", as: :rails_health_check

  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
