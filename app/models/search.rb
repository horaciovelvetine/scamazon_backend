class Search < ApplicationRecord
  has_and_belongs_to_many :items
  has_and_belongs_to_many :categories


  def get_results(search)
    binding.pry
    if search.category == "All"
      @results = Item.search_by_all(search.query)
      binding.pry
    else 
      @results = search.category.find_by_name(search.category).items.search_by_all(search.query)
      binding.pry
    end
    return @results
    binding.pry
  end


end
