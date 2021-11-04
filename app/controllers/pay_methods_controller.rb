class PayMethodsController < ApplicationController
  before_action :set_pay_method, only: %i[ show edit update destroy ]

  # GET /pay_methods or /pay_methods.json
  def index
    @pay_methods = PayMethod.all
  end

  # GET /pay_methods/1 or /pay_methods/1.json
  def show
  end

  # GET /pay_methods/new
  def new
    @pay_method = PayMethod.new
  end

  # GET /pay_methods/1/edit
  def edit
  end

  # POST /pay_methods or /pay_methods.json
  def create
    @pay_method = PayMethod.new(pay_method_params)

    respond_to do |format|
      if @pay_method.save
        format.html { redirect_to @pay_method, notice: "Pay method was successfully created." }
        format.json { render :show, status: :created, location: @pay_method }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pay_method.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pay_methods/1 or /pay_methods/1.json
  def update
    respond_to do |format|
      if @pay_method.update(pay_method_params)
        format.html { redirect_to @pay_method, notice: "Pay method was successfully updated." }
        format.json { render :show, status: :ok, location: @pay_method }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pay_method.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pay_methods/1 or /pay_methods/1.json
  def destroy
    @pay_method.destroy
    respond_to do |format|
      format.html { redirect_to pay_methods_url, notice: "Pay method was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pay_method
      @pay_method = PayMethod.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pay_method_params
      params.require(:pay_method).permit(:type, :number, :expires, :code.integer, :name_on)
    end
end
