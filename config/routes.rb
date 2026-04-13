Rails.application.routes.draw do
  devise_for :members
  devise_for :admins, :skip => [:registrations]
  root "home#index"


  get "up" => "rails/health#show", as: :rails_health_check

  get "backoffice", to: "backoffice/dashboard#index"
  get "admin", to: "backoffice/sessions#new"
  post "admin", to: "backoffice/sessions#create"
  get "admin/logout", to: "backoffice/sessions#destroy", as: :admin_logout

  namespace :backoffice do
    resources :admins
    get 'admins/index'
    root "dashboard#index"
    get "dashboard", to: "dashboard#index", as: :dashboard
    get "login", to: "sessions#new", as: :login
    resources :categories
    resources :ads
    resources :admins
  end

end