module ApplicationHelper


    def user_first_name
      @user.first_name
    end

    def user_last_name
      @user.last_name
    end

    def user_phone
      @user.phone
    end

    def user_address
      @user.address
    end

    def user_email
      @user.email
    end
    
    def get_categories
      @categories = Category.all.map { |c| c.name }
    end
    
end
