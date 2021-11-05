class Users::ListsController < ApplicationController
  
  # ## Should redirect to show with a random list chosen
  # def index
  #   @list = @user.lists.first

  #   if @list.nil?
  #     redirect_to new_user_list_path, notice: 'Start here by makeing your first list!'
  #   else
  #     redirect_to user_list_path(id: @list.id)
  #   end
  
  # end

  # ## NO VIEW creates a new list
  # def create
  #   @list = @user.lists.create(list_params)
    
  #   if @list.save
  #     redirect_to user_list_path(id: @list.id), notice: "List was successfully created! Time to add some items"
  #   else
  #     redirect_to user_lists_path, notice: "Sorry! We can't make heads or tails out of that list right now, please try again in a moment."
  #   end

  # end

  # ## Form for new list
  # def new; end

  # ## Should show a specific list
  # def show
  #   @lists = set_lists
  #   @list = set_list
  # end

  # def add_item
  #   @list.items << Item.find(params[:item_id])
  #   redirect_to user_list_path(id: @list.id), notice: "Item was successfully added to #{@list.name}"
  # end

  # def remove_item
  #   @list.items.delete(params[:item_id])
  #   redirect_to user_list_path(id: @list.id), notice: "Item was successfully removed from #{@list.name}"
  # end


  # ## NO VIEW
  # def update
  # #POST that updates a users list
  # binding.pry
  # end

  # ##NO VIEW
  # def destroy
  # #should destroy a users list
  # binding.pry
  # end

  # private

  #   def list_params
  #     params.require(:list).permit(:name, :description)
  #   end

  #   def set_lists
  #     @lists = @user.lists.all
  #   end

  #   def set_list
  #     if params[:id].nil?
  #       @list = @user.lists.first
  #     else
  #       @list = List.find(params[:id])
  #     end
  #   end

  #   def add_set_list
  #     @list = current_user.lists.find(params[:id])
  #   end

end






  # # GET /lists/new
  # def new
  #   @list = List.new
  # end

  # # GET /lists/1/edit
  # def edit
  # end

  # # POST /lists or /lists.json
  # def create
  #   @list = List.new(list_params)

  #   respond_to do |format|
  #     if @list.save
  #       format.html { redirect_to @list, notice: "List was successfully created." }
  #       format.json { render :show, status: :created, location: @list }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @list.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # PATCH/PUT /lists/1 or /lists/1.json
  # def update
  #   respond_to do |format|
  #     if @list.update(list_params)
  #       format.html { redirect_to @list, notice: "List was successfully updated." }
  #       format.json { render :show, status: :ok, location: @list }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @list.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /lists/1 or /lists/1.json
  # def destroy
  #   @list.destroy
  #   respond_to do |format|
  #     format.html { redirect_to lists_url, notice: "List was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  # private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_list
  #     @list = List.find(params[:id])
  #   end

  #   # Only allow a list of trusted parameters through.
  #   def list_params
  #     params.require(:list).permit(:name, :description, :private, :user_id)
  #   end
