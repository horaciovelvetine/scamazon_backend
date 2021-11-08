class ApplicationController < ActionController::Base
  

  def seed; end

  def populate
    users = params[:seed][:users].to_i
    items = params[:seed][:itmes].to_i
    Seed.initiate_seeding(users, items)
    redirect_to "/", notice: "Seeded Users & Items successfully"
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up)
    devise_parameter_sanitizer.permit(:account_update)
  end

  def seed_params
    params.require(:seed).permit(:users, :items)
  end


end
