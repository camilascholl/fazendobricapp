class Backoffice::RegistrationsController < Devise::RegistrationsController
  layout :backoffice_layout

  private

  def backoffice_layout
    action_name == "edit" ? "backoffice" : "backoffice_auth"
  end
end
