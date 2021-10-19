module SearchHelper 
  
  def category_formatter
    @categories = get_categories
    @formatted = []

    @categories.each do |category|
      @formatted << [category, category]
    end
    @formatted
  end

end
