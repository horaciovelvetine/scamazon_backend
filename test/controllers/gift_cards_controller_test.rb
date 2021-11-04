require "test_helper"

class GiftCardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gift_card = gift_cards(:one)
  end

  test "should get index" do
    get gift_cards_url
    assert_response :success
  end

  test "should get new" do
    get new_gift_card_url
    assert_response :success
  end

  test "should create gift_card" do
    assert_difference('GiftCard.count') do
      post gift_cards_url, params: { gift_card: { amount: @gift_card.amount, notes: @gift_card.notes, redeem_code: @gift_card.redeem_code, wallet_id: @gift_card.wallet_id } }
    end

    assert_redirected_to gift_card_url(GiftCard.last)
  end

  test "should show gift_card" do
    get gift_card_url(@gift_card)
    assert_response :success
  end

  test "should get edit" do
    get edit_gift_card_url(@gift_card)
    assert_response :success
  end

  test "should update gift_card" do
    patch gift_card_url(@gift_card), params: { gift_card: { amount: @gift_card.amount, notes: @gift_card.notes, redeem_code: @gift_card.redeem_code, wallet_id: @gift_card.wallet_id } }
    assert_redirected_to gift_card_url(@gift_card)
  end

  test "should destroy gift_card" do
    assert_difference('GiftCard.count', -1) do
      delete gift_card_url(@gift_card)
    end

    assert_redirected_to gift_cards_url
  end
end
