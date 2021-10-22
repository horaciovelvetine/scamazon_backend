class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, :set_instance_user, if: :devise_controller?
  before_action :current_user
  before_action :set_instance_user

  helper_method :find_item, :find_review

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

  private 

    def find_item
      @item = Item.find(params[:id])
    end

    def find_review
      @review = Review.find(params[:id])
    end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up)
    devise_parameter_sanitizer.permit(:account_update)
  end

  def set_instance_user
    if current_user
      @user = current_user
    end
  end

end
