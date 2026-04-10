Rails.application.routes.draw do
  devise_for :admins, path: "backoffice", controllers: {
    sessions: "backoffice/sessions",
    registrations: "backoffice/registrations",
    passwords: "backoffice/passwords",
    confirmations: "backoffice/confirmations",
    unlocks: "backoffice/unlocks"
  }

  devise_for :members

  root "home#index"

  get "up" => "rails/health#show", as: :rails_health_check

  namespace :backoffice do
    root "dashboard#index"
  end
end