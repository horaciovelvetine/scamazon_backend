class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :current_user


  # Homepage
  def home; end

  def seed; end

  def covid; end

  def slime; end

  def conditions; end

  def privacynotice; end

  def populate
    Seed.populate_store(params)
    redirect_to "/", notice: "Seeded Users & Items successfully"
  end



  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up)
    devise_parameter_sanitizer.permit(:account_update)
  end
end
