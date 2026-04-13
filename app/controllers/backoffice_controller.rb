class BackofficeController < ApplicationController
  layout "backoffice"

  def index
    @admins = Admin.all
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def update
    @admin = Admin.find(params[:id])

    if @admin.update(admin_params)
      redirect_to backoffice_admins_path, notice: "Administrador atualizado com sucesso."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @admin = Admin.find(params[:id])
    @admin.destroy

    redirect_to backoffice_admins_path, notice: "Administrador excluído com sucesso."
  end

  private

  def admin_params
    params.require(:admin).permit(:email, :password, :password_confirmation)
  end
end