class Users::GiftCardsController < ApplicationController
  
  def show; end

  def create
    @balance = GiftCard.balance_calculator
    @gift_card = @user.gift_cards.new(gift_card_params)
    @gift_card.balance = @balance
    User.add_balance(@user, @balance)
    
    if @gift_card.save && @user.save
      redirect_to user_gift_card_manager_path, notice: "Card amount successfully added to your account."
    else
      redirect_to user_gift_card_manager_path, notice: "That didn't work. Please try again"
    end
  end


  private

  def gift_card_params
    params.require(:gift_card).permit(:code, :balance, :notes)
  end

end
