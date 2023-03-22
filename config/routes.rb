Rails.application.routes.draw do
  resources :tenants
  resources :leases, only: [:index, :create, :destroy]
  resources :apartments
end
