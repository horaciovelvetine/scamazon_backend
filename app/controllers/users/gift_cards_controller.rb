class Users::GiftCardsController < ApplicationController

  def create 
    binding.pry
    @gift_card = @user.gift_cards.create(gift_card_params)
    User.add_gift_card(@user, @gift_card)
    
    if @gift_card.save && @user.save
      redirect_to gift_card_manger_path, notice: "Card amount successfully added to your account."
    else
      redirect_to gift_card_manger_path, notice: "That didn't work. Please try again"
    end
  end

  def show; end

  private

  def gift_card_params
    params.require(:gift_card).permit(:redemption_code, :amount, :notes)
  end

end
