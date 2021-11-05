class SearchesController < ApplicationController
#all need JSON action handle!
  before_action :results, only: [:show]

  def show
    #should show a searches results page and load in all of a searches results
    binding.pry
  end

  def create
    #checks if user to associate search
    #creates new search and makes associations 
    #then redirects to show with that new search object to display results
    binding.pry

    #for ref
          #   def create
          
      #     @search = Search.new
      #     @search.set_query(@search, params[:search][:query])
      #     @search.set_categories(@search, params[:search][:category])
          
      #     if !@user.nil?
      #       @search.set_user(@search, @user)
      #     end
          
      #     @search.get_results(@search)
          
      #     if @search.items.length > 0
      #       redirect_to results_path(id: @search.id)
      #     else
      #       redirect_to root_path, notice: "No results matching your search, please try again and pay special attention to your spelling."
      #     end
    
  end

  private 

  def search_params
    params.require(:search).permit(:query, :category)
  end

  
  def results
    @results = @search.items
  end

end



# class SearchesController < ApplicationController


  
#   def show; end


