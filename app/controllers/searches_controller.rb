class SearchesController < ApplicationController

  def create
    

    @s = Search.new(search_params)
    binding.pry
    @results = @s.get_results

    if @results.length > 0
      @search.save
      @results.each do |item|
        @search.items << item
      end
      redirect_to search_path(@search)
    else
      redirect_to root_path, notice: "No results matching your search, please try again and pay special attention to your spelling."
    end


  end


  private 

  def search_params
    params.require(:search).permit(:category, :query)
  end

end
