class GiftCardsController < ApplicationController
  before_action :set_gift_card, only: %i[ show edit update destroy ]

  # GET /gift_cards or /gift_cards.json
  def index
    @gift_cards = GiftCard.all
  end

  # GET /gift_cards/1 or /gift_cards/1.json
  def show
  end

  # GET /gift_cards/new
  def new
    @gift_card = GiftCard.new
  end

  # GET /gift_cards/1/edit
  def edit
  end

  # POST /gift_cards or /gift_cards.json
  def create
    @gift_card = GiftCard.new(gift_card_params)

    respond_to do |format|
      if @gift_card.save
        format.html { redirect_to @gift_card, notice: "Gift card was successfully created." }
        format.json { render :show, status: :created, location: @gift_card }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gift_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gift_cards/1 or /gift_cards/1.json
  def update
    respond_to do |format|
      if @gift_card.update(gift_card_params)
        format.html { redirect_to @gift_card, notice: "Gift card was successfully updated." }
        format.json { render :show, status: :ok, location: @gift_card }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gift_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gift_cards/1 or /gift_cards/1.json
  def destroy
    @gift_card.destroy
    respond_to do |format|
      format.html { redirect_to gift_cards_url, notice: "Gift card was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gift_card
      @gift_card = GiftCard.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gift_card_params
      params.require(:gift_card).permit(:redeem_code, :notes, :amount, :wallet_id)
    end
end
