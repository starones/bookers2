class ApplicationController < ActionController::Base
  before_action :authenticate_user!,except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?



# 　新規登録後とログイン後のリダイレクト先
  def after_sign_in_path_for(resource)
    users_path
  end

  def after_sign_in_path_for(resource)
  users_path
  end
# ここまで

 protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
