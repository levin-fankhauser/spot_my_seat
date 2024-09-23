Rails.application.routes.draw do
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
  root to: "home#index"

  get "admin/seats", to: "seats#admin_index", as: "admin_seats"

  get "up" => "rails/health#show", as: :rails_health_check

  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
