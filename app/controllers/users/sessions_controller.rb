class Users::SessionsController < Devise::SessionsController
  layout false, except: [:show]
  
  def after_sign_in_path_for(_resource)
    profile_path
  end

  def show; end
  

end