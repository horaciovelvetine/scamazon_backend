module CategoryHelper
  
  def get_categories
    @categories = Category.all.map { |c| c.name }
  end
  
end
