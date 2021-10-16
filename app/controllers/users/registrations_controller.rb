class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  
  layout false, except: [:edit]
  
  def after_sign_up_path_for(_resource)
    profile_path
  end

  def after_update_path_for(_resource)
    edit_user_registration_path
  end

  protected

  
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone, :address, :slime, :balance ])
  end

  
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :phone, :address, :slime, :balance ])
  end

end
