class Backoffice::SessionsController < ApplicationController
  layout "backoffice_auth"

  def new
    redirect_to backoffice_dashboard_path if admin_signed_in?
  end

  def create
    admin = Admin.authenticate(params[:email], params[:password])

    if admin
      session[:admin_id] = admin.id
      redirect_to backoffice_dashboard_path, notice: "Login realizado com sucesso."
    else
      flash.now[:alert] = "E-mail ou senha inválidos."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    reset_session
    redirect_to admin_path, notice: "Sessão encerrada com sucesso."
  end
end
