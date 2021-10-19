class Search < ApplicationRecord
  has_and_belongs_to_many :items
  has_and_belongs_to_many :categories


  def get_results(search)

    if search.categories.length == 1 && search.categories.first.name == "All"
      search.items << Item.search_by_all(search.query)
    elsif search.categories.length == 1 && search.categories.first.name != "All"
      search.items << search.categories.first.items.search_by_all(search.query)
    elsif search.categories.length > 1
      ## for later sorting of more detailed search which might have two or more categories
      binding.pry
    end
    search.save
  end

  def set_categories(search, categories)

    if categories.is_a?(Array)
      categories.each do |category|
        search.categories << category
      end
    elsif categories.is_a?(String)
      name = categories
      search.categories << Category.find_by_name(name)
    else
      ##What data type?
      binding.pry
    end
  
  end

  def set_query(search, query)
    search.query = query
  end

  def set_user(search, user)
    search.user_id = user.id
  end



end
