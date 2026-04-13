class Backoffice::SessionsController < Devise::SessionsController
  layout "backoffice_auth"

  def new
    redirect_to root_path, alert: "O login administrativo nao esta disponivel."
  end
end
