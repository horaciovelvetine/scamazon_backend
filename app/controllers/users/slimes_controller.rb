class Users::SlimesController < ApplicationController
  
  
  def slime_user
    User.authorize_for_the_slime_time(@user)
    redirect_to profile_path, notice:"#{@user.first_name} welcome to slime. Start shopping to benefit now!"
  end


end
