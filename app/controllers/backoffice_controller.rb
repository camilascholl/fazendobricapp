class BackofficeController < ApplicationController
  layout "backoffice"

  before_action :require_admin!

  private

  def require_admin!
    return if admin_signed_in?

    redirect_to admin_path, alert: "Faça login para acessar a área administrativa."
  end
end
