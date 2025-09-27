class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path   
  end

  def reject_guest_user
    if current_user.guest?
      redirect_to root_path, alert: "ゲストユーザーはこの操作を行えません。"
    end
  end
end
