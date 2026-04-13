class ApplicationController < ActionController::Base
  helper_method :current_admin, :admin_signed_in?

  private

  def current_admin
    @current_admin ||= Admin.find_by(id: session[:admin_id]) if session[:admin_id]
  end

  def admin_signed_in?
    current_admin.present?
  end
end
