class Users::SessionsController < Devise::SessionsController
  layout false, except: [:show]
  
  def after_sign_in_path_for(_resource)
    profile_path
  end

  def show; end

  def destroy
    # in pry to prevent storage of abandoned carts when no user is logged in
    binding.pry
    super
  end

  

end