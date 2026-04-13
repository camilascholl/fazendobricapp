class Backoffice::AdminsController < BackofficeController
  def index
    @admin = Admin.new
    @admins = Admin.order(created_at: :desc)
  end

  def create
    @admin = Admin.new(admin_params.except(:password_confirmation))
    validate_password_confirmation
    @admins = Admin.order(created_at: :desc)

    if @admin.errors.empty? && @admin.save
      redirect_to backoffice_admins_path, notice: "Administrador #{@admin.email} criado com sucesso."
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def admin_params
    params.require(:admin).permit(:email, :password, :password_confirmation)
  end

  def validate_password_confirmation
    return if admin_params[:password] == admin_params[:password_confirmation]

    @admin.errors.add(:password_confirmation, "não confere com a senha informada")
  end
end
