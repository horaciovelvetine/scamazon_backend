class Users::StoreController < ApplicationController
before_action :get_user_store, only: [:show, :edit, :update, :destroy]

  layout false, only: [:new]
  
  def create
    binding.pry
    @store = current_user.store.create(store_params)
    @store.inventory.create
    redirect_to user_store_path(id: @store.id), notice: "Store created successfully, head over to your inventory page to add items and start selling!" 
    binding.pry
  end

  ## New Store View
  def new; end

  ## Store Dashboard view
  def show; end

  def edit; end

  def update; end

  def destroy; end

  private
    def get_user_store
      @store = User.store
    end


    def store_params
      params.require(:store).permit(:name, :email, :address, :description, :logo, :industry, :mission_statement, :ein, :user_id)
    end
end

## for later ref

  # # GET /stores/new
  # def new
  #   @store = Store.new
  # end

  # # GET /stores/1/edit
  # def edit
  # end

  # # POST /stores or /stores.json
  # def create
  #   @store = Store.new(store_params)

  #   respond_to do |format|
  #     if @store.save
  #       format.html { redirect_to @store, notice: "Store was successfully created." }
  #       format.json { render :show, status: :created, location: @store }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @store.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # PATCH/PUT /stores/1 or /stores/1.json
  # def update
  #   respond_to do |format|
  #     if @store.update(store_params)
  #       format.html { redirect_to @store, notice: "Store was successfully updated." }
  #       format.json { render :show, status: :ok, location: @store }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @store.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /stores/1 or /stores/1.json
  # def destroy
  #   @store.destroy
  #   respond_to do |format|
  #     format.html { redirect_to stores_url, notice: "Store was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end
  
  # # Only allow a list of trusted parameters through.
  # def store_params
  #   params.require(:store).permit(:name, :email, :description, :logo, :industry, :mission_statement, :ein, :user)
  # end