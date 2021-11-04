class SearchesController < ApplicationController
  before_action :set_search, only: [:show, :sort_by]
  before_action :results, only: [:show]

  def create
    
    @search = Search.new
    @search.set_query(@search, params[:search][:query])
    @search.set_categories(@search, params[:search][:category])
    
    if !@user.nil?
      @search.set_user(@search, @user)
    end
    
    @search.get_results(@search)
    
    if @search.items.length > 0
      redirect_to results_path(id: @search.id)
    else
      redirect_to root_path, notice: "No results matching your search, please try again and pay special attention to your spelling."
    end

  end
  
  def show; end

  def sort_by
  end

  private 

  def search_params
    params.require(:search).permit(:query, :category)
  end

  def set_search
    if params[:id]
      @search = Search.find(params[:id])
    end
    if params[:format]
      @search = Search.find(params[:format])
    end
  end
  
  def results
    @results = @search.items
  end

end
