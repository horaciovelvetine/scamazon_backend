module SearchHelper
  @@START HERE YOU GOOF 
  def category_formatter
    @results = get_categories

    @double = { options => []}
    @results.each do |category|
      @double.options << [category, category]
      return @
    end


  end

end
